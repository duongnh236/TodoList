import 'package:fluttertemplate/src/core/helper/failure.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_isar.dart';
import 'package:fluttertemplate/src/domain/entities/activity_entity.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/domain/repositories/home_repository/home_repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeUseCase {

  HomeUseCase(this.homeRepository);
  final HomeRepository homeRepository;

  Future<List<TodoIsar>> getTodoItemsLocal() async {
    return await homeRepository.getTodoItemsLocal();
  }
  Future<bool> saveTodoItemsLocal(List<TodoIsar> items) async {
    return await homeRepository.saveTodoItemsLocal(items);
  }
  Future<bool> isHasData() async {
    return await homeRepository.isHasData();
  }

  Future<Either<Failure, Activity>> testApi() async {
    return await homeRepository.testApi();
  }

}