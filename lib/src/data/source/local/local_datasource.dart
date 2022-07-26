import 'dart:io';

import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'models/todo_item.dart';

class LocalDataSource {
  static Future<void> initialize() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    Hive.init(tempPath);
    Hive.registerAdapter<TodoItemHive>(TodoItemHiveAdapter());

    await Hive.openBox<TodoItemHive>(TodoItemHive.boxKey);
  }

  bool hasData() {
    final itemsBox = Hive.box<TodoItemHive>(TodoItemHive.boxKey);
    return itemsBox.length > 0;
  }

  Future<void> saveTodoItems(List<TodoItemHive> itemsHive) async {

    final items = Hive.box<TodoItemHive>(TodoItemHive.boxKey);
    await items.clear();
    final aaa = {for (var e in itemsHive) e.name : e};

    await items.putAll(aaa);
  }

  List<TodoItemHive> getAllTodoItems() {
    final itemBox = Hive.box<TodoItemHive>(TodoItemHive.boxKey);
    final itemsHive = List.generate(itemBox.length, (index) => itemBox.getAt(index)).whereType<TodoItemHive>().toList();
    return itemsHive;
  }
}