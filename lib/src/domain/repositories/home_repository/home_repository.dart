import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';

import '../../../data/source/local/models/todo_item.dart';

abstract class HomeRepository {
  Future<List<TodoItemHive>> getTodoItemsLocal();
  Future<bool> saveTodoItemsLocal(List<TodoItemHive> items);
  Future<bool> isHasData();
}