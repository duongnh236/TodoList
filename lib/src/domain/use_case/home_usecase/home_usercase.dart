import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/domain/repositories/home_repository/home_repository.dart';

class HomeUseCase {

  HomeUseCase(this.homeRepository);
  final HomeRepository homeRepository;

  Future<List<ToDoItemEntity>> getTodoItemsLocal() async {
    return await homeRepository.getTodoItemsLocal();
  }
  Future<bool> saveTodoItemsLocal(List<ToDoItemEntity> items) async {
    return await homeRepository.saveTodoItemsLocal(items);
  }
  Future<bool> isHasData() async {
    return await homeRepository.isHasData();
  }
}