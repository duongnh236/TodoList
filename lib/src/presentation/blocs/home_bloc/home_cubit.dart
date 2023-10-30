import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/domain/use_case/home_usecase/home_usercase.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_event.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_state.dart';
import '../../../data/source/local/models/todo_item.dart';
import '../../../domain/entities/todo_item_entity.dart';

 class HomeCubit extends Bloc<HomeEvent, HomeState> {

  final HomeUseCase homeUseCase;
  late final List<TodoItemHive>? items;
  
  HomeCubit(this.homeUseCase) : super(HomeInitialState()) {
    on<HomeGetTodoEvent>((event, emit) => getTodoItems());
    on<HomeToggleStatusEvent>((event, emit) => handleTodoList(index: event.index));
    on<HomeCreateTaskEvent>((event, emit) => createTask(taskName: event.taskName));
  }


  Future<void> getTodoItems() async {
    if (await isHasData()) {
      items = await homeUseCase.getTodoItemsLocal();
    } else {
      items = [];
    }
    emit(HomeHandleStatusItemState(items));
  }

  void handleCLick(bool isCheck) {
    // state.isCheck = !isCheck;
    // final newState = state.copyWith(isCheck: !isCheck);

    // emit(newState);
    // emit(HomeClick1(isChecked: isCheck));
  }

  Future<void> handleTodoList({int? index}) async {
    final currentState = state as HomeHandleStatusItemState;
    final newItems = homeUseCase.handleToggle(index: index, items: currentState.items);
    final bool isSave = await homeUseCase.saveTodoItemsLocal(newItems);
    final _items =  await homeUseCase.getTodoItemsLocal();

    if (isSave) {
      emit(HomeHandleStatusItemState(List.of(_items)));
    } else {
      emit(HomeErrorState('please try again', items!));
    }
  }

  Future<void> createTask({String? taskName}) async {
    final TodoItemHive todoTask = TodoItemHive(isChecked: false, name: taskName ?? '');
    items!.add(todoTask);
    final bool isSave = await homeUseCase.saveTodoItemsLocal(items!);
    if (isSave) {
      // emit(state.copyWith(items: List.of(items!)));
      emit(HomeHandleStatusItemState(List.from(items!)));
    } else {
      emit(HomeErrorState('please try again', items!));
    }
  }
  Future<bool> isHasData() async {
    return await homeUseCase.isHasData();
  }
}