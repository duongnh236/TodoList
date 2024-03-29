import 'package:fluttertemplate/src/data/source/local/local_datasource.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_item.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/domain/repositories/home_repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this.localDataSource);
  final LocalDataSource localDataSource;

  @override
  Future<List<ToDoItemEntity>> getTodoItemsLocal() async {
    final List<TodoItemHive> todoItemsHive =  await localDataSource.getAllTodoItems();
    final List<ToDoItemEntity> todoEntities = todoItemsHive.map((e) => ToDoItemEntity(name: e.name, isChecked: e.isChecked)).toList();
    return todoEntities;
  }

  @override
  Future<bool> saveTodoItemsLocal(List<ToDoItemEntity> items) async  {
    final List<TodoItemHive> itemsHive = items.map((e) => TodoItemHive()..isChecked = e.isChecked
                                                                        ..name = e.name).toList();
    await localDataSource.saveTodoItems(itemsHive);
    return Future.value(true);
  }

  @override
  Future<bool> isHasData() async {
    return await localDataSource.hasData();
  }

}