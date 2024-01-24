
import 'package:fluttertemplate/src/core/dio_service/dio_service.dart';
import 'package:fluttertemplate/src/core/dio_service/rest_client.dart';
import 'package:fluttertemplate/src/core/exception/exception.dart';
import 'package:fluttertemplate/src/core/helper/failure.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_item.dart';
import 'package:fluttertemplate/src/data/source/remote/home_service.dart';
import 'package:fluttertemplate/src/domain/entities/activity_entity.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/domain/repositories/home_repository/home_repository.dart';
import 'package:fpdart/src/either.dart';
import '../source/local/hive/hive_datasource.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this.hiveDataSource, this.homeService);
  final HiveDataSource hiveDataSource;
  final HomeService homeService;
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

  @override
  Future<Either<Failure, Activity>> testApi() async {
    final data = await homeService.testApi();
    try {
      return Either.right(data);
    } on RestApiException catch (e) {
      return Either.left(ConnectionFailure(e.status, e.message));
    } catch (e) {
      return Either.left(const ParsingFailure('errro'));
    }
  }
  

  //https://www.boredapi.com/api/activity

}