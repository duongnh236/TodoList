import 'package:fluttertemplate/src/core/helper/failure.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_isar.dart';
import 'package:fluttertemplate/src/domain/entities/activity_entity.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class HomeRepository {
  Future<List<TodoIsar>> getTodoItemsLocal();
  Future<bool> saveTodoItemsLocal(List<TodoIsar> items);
  Future<bool> isHasData();
  Future<Either<Failure, Activity>> testApi();
}