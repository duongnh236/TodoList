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

    // emit(newState);
    emit(newState);
  }

  Future<void> handleTodoList({int? index}) async {
    emit(HomeBusy());
    items![index ?? 0].isChecked = !items![index ?? 0].isChecked!;
    final bool isSave = await homeUseCase.saveTodoItemsLocal(items!);
    final newState = state.copyWith(items: List.from(items!));
    if (isSave) {
      emit(newState);
    } else {
      emit(HomeErrorState('please try again', items!));
    }
  }

  Future<void> createTask({String? taskName}) async {
    final ToDoItemEntity todoTask = ToDoItemEntity(isChecked: false, name: taskName ?? '');
    items!.add(todoTask);
    final bool isSave = await homeUseCase.saveTodoItemsLocal(items!);
    if (isSave) {
      emit(state.copyWith(items: List.from(items!)));
      // emit(HomeHandleStatusItemState(items: List.from(items!)));
    } else {
      emit(HomeErrorState('please try again', items!));
    }
  }
  Future<bool> isHasData() async {
    return await homeUseCase.isHasData();
  }
}