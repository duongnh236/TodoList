import 'package:fluttertemplate/src/data/source/local/local_datasource.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_item.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/domain/repositories/home_repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this.localDataSource);
  final LocalDataSource localDataSource;

  @override
  Future<List<TodoItemHive>> getTodoItemsLocal() async {
    final List<TodoItemHive> todoItemsHive =  await localDataSource.getAllTodoItems();
    // final List<ToDoItemEntity> todoEntities = todoItemsHive.map((e) => ToDoItemEntity(name: e.name, isChecked: e.isChecked)).toList();
    return todoItemsHive;
  }

  @override
  Future<bool> saveTodoItemsLocal(List<TodoItemHive> items) async  {
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