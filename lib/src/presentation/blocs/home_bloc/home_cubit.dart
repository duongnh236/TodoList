import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/domain/use_case/home_usecase/home_usercase.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_state.dart';
import '../../../domain/entities/todo_item_entity.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeUseCase) : super(HomeInitialState());

  final HomeUseCase homeUseCase;
  late final List<ToDoItemEntity>? items;
  Future<void> getTodoItems() async {
    if (await isHasData()) {
      items = await homeUseCase.getTodoItemsLocal();
    } else {
      items = [];
    }
    emit(state.copyWith(items: items));
  }

  void handleCLick(bool isCheck) {
    // state.isCheck = !isCheck;
    final newState = state.copyWith(isCheck: !isCheck);

    emit(newState);
    // emit(HomeClick1(isChecked: isCheck));
  }
  List<ToDoItemEntity> doEditlist({int? index}) {
    items?[index ?? 0] = items![index ?? 0].copyWith(isChecked: !items![index ?? 0].isChecked! );
    return List.from(items!);
  }
  Future<void> handleTodoList({int? index}) async {
    final _items = doEditlist(index: index);
    final bool isSave = await homeUseCase.saveTodoItemsLocal(_items);
    if (isSave) {
      emit(state.copyWith(items: _items));
    } else {
      emit(HomeErrorState('please try again', items!));
    }
  }

  Future<void> createTask({String? taskName}) async {
    final ToDoItemEntity todoTask = ToDoItemEntity(isChecked: false, name: taskName ?? '');
    items!.add(todoTask);
    final bool isSave = await homeUseCase.saveTodoItemsLocal(items!);
    if (isSave) {
      emit(state.copyWith(items: List.of(items!)));
      // emit(HomeHandleStatusItemState(items: List.from(items!)));
    } else {
      emit(HomeErrorState('please try again', items!));
    }
  }
  Future<bool> isHasData() async {
    return await homeUseCase.isHasData();
  }
}