import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';

abstract class HomeRepository {
  Future<List<ToDoItemEntity>> getTodoItemsLocal();
  Future<bool> saveTodoItemsLocal(List<ToDoItemEntity> items);
  Future<bool> isHasData();
}