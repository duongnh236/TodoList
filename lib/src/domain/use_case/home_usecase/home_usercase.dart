import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/domain/repositories/home_repository/home_repository.dart';

import '../../../data/source/local/models/todo_item.dart';

class HomeUseCase {

  HomeUseCase(this.homeRepository);
  final HomeRepository homeRepository;

  Future<List<TodoItemHive>> getTodoItemsLocal() async {
    return await homeRepository.getTodoItemsLocal();
  }
  Future<bool> saveTodoItemsLocal(List<TodoItemHive> items) async {
    return await homeRepository.saveTodoItemsLocal(items);
  }
  Future<bool> isHasData() async {
    return await homeRepository.isHasData();
  }
  List<TodoItemHive> handleToggle({int? index, List<TodoItemHive>? items }) {
    items![index ?? 0].isChecked = !items![index ?? 0].isChecked!;
    return List.of(items);
  }
}