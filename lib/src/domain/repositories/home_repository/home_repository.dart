import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';

abstract class HomeRepository {
  List<ToDoItemEntity> getTodoItemsLocal();
  bool saveTodoItemsLocal(List<ToDoItemEntity> items);
  bool isHasData();
}