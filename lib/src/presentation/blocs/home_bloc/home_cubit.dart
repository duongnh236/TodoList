import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/domain/user_case/home_usercase/home_usercase.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_state.dart';
import '../../../domain/entities/todo_item_entity.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeUserCase) : super(HomeInitialState());

  final HomeUserCase homeUserCase;

  List<ToDoItemEntity>? items;
  void getTodoItems() {
    if (isHasData()) {
      items = homeUserCase.getTodoItemsLocal();
    } else {
      items = [];
    }
    emit(HomeHandleStatusItemState(items: items));
  }
  void handleTodoList({int? index}) {
    items![index ?? 0].isChecked = !items![index ?? 0].isChecked!;
    final bool isSave = homeUserCase.saveTodoItemsLocal(items!);
    emit(HomeHandleStatusItemState(items: List.of(items!)));
  }

  void createTask({String? taskName}) {
    final ToDoItemEntity todoTask = ToDoItemEntity(isChecked: false, name: taskName ?? '');
    items!.add(todoTask);
    final bool isSave = homeUserCase.saveTodoItemsLocal(items!);
    emit(HomeHandleStatusItemState(items: items));
  }
  bool isHasData() {
    return homeUserCase.isHasData();
  }
}