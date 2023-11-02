import 'package:fluttertemplate/src/core/dio_service/dio_service.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_item.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/domain/repositories/home_repository/home_repository.dart';
import '../source/local/hive/hive_datasource.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this.hiveDataSource);
  final HiveDataSource hiveDataSource;
  ApiBaseCore apiBaseCore = ApiBaseCore();
  @override
  Future<List<ToDoItemEntity>> getTodoItemsLocal() async {
    final List<TodoItemHive> todoItemsHive =  await hiveDataSource.getAllTodoItems();
    final List<ToDoItemEntity> todoEntities = todoItemsHive.map((e) => ToDoItemEntity(name: e.name, isChecked: e.isChecked)).toList();
    return todoEntities;
  }

  @override
  Future<bool> saveTodoItemsLocal(List<ToDoItemEntity> items) async  {
    final List<TodoItemHive> itemsHive = items.map((e) => TodoItemHive()..isChecked = e.isChecked
                                                                        ..name = e.name).toList();
    await hiveDataSource.saveTodoItems(itemsHive);
    return Future.value(true);
  }

  @override
  Future<bool> isHasData() async {
    return await hiveDataSource.hasData();
  }

}