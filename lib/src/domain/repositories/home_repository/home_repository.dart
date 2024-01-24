import 'package:fluttertemplate/src/core/helper/failure.dart';
import 'package:fluttertemplate/src/domain/entities/activity_entity.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class HomeRepository {
  Future<List<ToDoItemEntity>> getTodoItemsLocal();
  Future<bool> saveTodoItemsLocal(List<ToDoItemEntity> items);
  Future<bool> isHasData();
  Future<Either<Failure, Activity>> testApi();
}