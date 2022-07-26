import 'package:fluttertemplate/src/data/source/local/local_datasource.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_item.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/domain/repositories/home_repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this.localDataSource);
  final LocalDataSource localDataSource;

  @override
  List<ToDoItemEntity> getTodoItemsLocal() {
    final List<TodoItemHive> todoItemsHive =  localDataSource.getAllTodoItems();
    final List<ToDoItemEntity> todoEntities = todoItemsHive.map((e) => ToDoItemEntity(name: e.name, isChecked: e.isChecked)).toList();
    return todoEntities;
  }

  @override
  bool saveTodoItemsLocal(List<ToDoItemEntity> items)  {
    final List<TodoItemHive> itemsHive = items.map((e) => TodoItemHive()..isChecked = e.isChecked
                                                                        ..name = e.name).toList();
    localDataSource.saveTodoItems(itemsHive);
    return true;
  }

  @override
  bool isHasData() {
    return localDataSource.hasData();
  }

}