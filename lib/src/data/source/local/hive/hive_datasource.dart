import 'package:fluttertemplate/src/core/utils/local_database_util.dart';
import 'package:fluttertemplate/src/data/source/local/hive/base_local_datasource.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import '../models/todo_item.dart';

class HiveDataSource extends BaseLocalDataSource<TodoItemHive, ToDoItemEntity>{
  HiveDataSource() : super(boxName: TodoItemHive.boxKey) {
    DatabaseUtil.registerAdapter<TodoItemHive>(TodoItemHiveAdapter());
  }

  Future<bool> hasData() async {
    try {
      final itemsHive = await getAll();
      return itemsHive.isNotEmpty;
    } catch (error) {
      rethrow;
    }

  }

  Future<void> saveTodoItems(List<TodoItemHive> itemsHive) async {
    await clear();
    final aaa = {for (var e in itemsHive) e.name ?? '' : e};
    await putAll(aaa);
  }

  Future<List<TodoItemHive>> getAllTodoItems() async {
    final itemsHive = await getAll();
    return itemsHive;
  }
}