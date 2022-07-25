import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_state.dart';
import '../../../domain/entities/todo_item_entity.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    getTodoItems();
  }

  List<ToDoItemEntity>? items;
  void getTodoItems() {
    items = [ToDoItemEntity(isChecked: false, name: 'đi chơi'),ToDoItemEntity(isChecked: false, name: 'đi ngủ'),ToDoItemEntity(isChecked: false, name: 'đi xem phim'),ToDoItemEntity(isChecked: false, name: 'đi dạo'),ToDoItemEntity(isChecked: false, name: 'đi bơi'),ToDoItemEntity(isChecked: false, name: 'đi bộ')];
    emit(HomeHandleStatusItemState(items: items));
  }
  void handleTodoList({int? index}) {
    items![index ?? 0].isChecked = !items![index ?? 0].isChecked!;
    emit(HomeHandleStatusItemState(items: List.of(items!)));
  }
}