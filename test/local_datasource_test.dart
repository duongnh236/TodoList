import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertemplate/src/data/source/local/local_datasource.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_item.dart';
import 'package:hive/hive.dart';


void main() {


  group('description', () {
    late LocalDataSource localDataSource;
    final Map<String, TodoItemHive> items = {
      '1': TodoItemHive(isChecked: true, name: 'a'),
      '2': TodoItemHive(isChecked: true, name: 'b'),
    };
    late Box box;
    setUp(()  async {
      Hive.init('./local_database_test_file/');
      localDataSource = LocalDataSource();
      box = await localDataSource.getBoxInstance;
    });

    tearDown(() async {
      await box.clear();
    });

    group('Test class LocalDataSource', () {
      test('Should call saveTodoItems function return array data local with length 1', () async {
        final List<TodoItemHive> _mockItems = [TodoItemHive(name: 'a', isChecked: true)];
        await localDataSource.saveTodoItems(_mockItems);
        expect(box.toMap().length, 1);
      });

      test('Should call hasData function', () async {
        await box.putAll(items);
        await localDataSource.hasData();
        expect(box.toMap().length, 2);
        expect(box.toMap().containsKey('2'), true);
      });

      test('Should call getAllTodoItems function', () async {
        await box.putAll(items);
        await localDataSource.getAllTodoItems();
        expect(box.toMap().length, 2);
        expect(box.toMap().containsKey('2'), true);
      });

    });
  });
}