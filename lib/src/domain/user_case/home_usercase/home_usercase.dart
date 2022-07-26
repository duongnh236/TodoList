import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/domain/repositories/home_repository/home_repository.dart';

class HomeUserCase {

  HomeUserCase(this.homeRepository);
  final HomeRepository homeRepository;

  List<ToDoItemEntity> getTodoItemsLocal() {
    return homeRepository.getTodoItemsLocal();
  }
  bool saveTodoItemsLocal(List<ToDoItemEntity> items) {
    return homeRepository.saveTodoItemsLocal(items);
  }
  bool isHasData() {
    return homeRepository.isHasData();
  }
}