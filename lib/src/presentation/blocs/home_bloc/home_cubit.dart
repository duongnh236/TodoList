import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/domain/use_case/home_usecase/home_usercase.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_state.dart';
import '../../../domain/entities/todo_item_entity.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeUserCase) : super(HomeInitialState());

  final HomeUseCase homeUserCase;

  List<ToDoItemEntity> items = [];

  void getTodoItems() {
    if (isHasData()) {
      items = homeUserCase.getTodoItemsLocal();
    } else {
      items = [];
    }
    emit(HomeHandleStatusItemState(items));
  }
  void handleTodoList({int? index}) {
    items[index ?? 0].isChecked = !items[index ?? 0].isChecked!;
    final bool isSave = homeUserCase.saveTodoItemsLocal(items);
    if (isSave) {
      emit(HomeHandleStatusItemState(items));
    } else {
      emit(HomeErrorState('please try again', items));
    }
  }

  void createTask({String? taskName}) {
    final ToDoItemEntity todoTask = ToDoItemEntity(isChecked: false, name: taskName ?? '');
    items.add(todoTask);
    final bool isSave = homeUserCase.saveTodoItemsLocal(items);
    if (isSave) {
      emit(HomeHandleStatusItemState(items));
    } else {
      emit(HomeErrorState('please try again', items));
    }
  }
  bool isHasData() {
    return homeUserCase.isHasData();
  }
}