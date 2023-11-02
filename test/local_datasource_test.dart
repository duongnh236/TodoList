import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertemplate/src/data/source/local/hive/hive_datasource.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_item.dart';
import 'package:hive/hive.dart';


void main() {
  late HiveDataSource localDataSource;
  final Map<String, TodoItemHive> items = {
    '1': TodoItemHive(isChecked: true, name: 'a'),
    '2': TodoItemHive(isChecked: true, name: 'b'),
  };
  late Box box;
  setUp(()  async {
    Hive.init('./local_database_test_file/');
    localDataSource = HiveDataSource();
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
    group('test base_local_datasoure when local_datasoure extends',  () {
      test('should call putAll check value return ', () async {
        await box.putAll(items);
        final List result = await localDataSource.getAll();
        expect(result.length, 2);
        expect(result, items.values);
      });

      test('should call putAt check value return', () async {
        final TodoItemHive todoItemHive = TodoItemHive(name: 'ccc', isChecked: true);
        await box.putAll(items);

        await localDataSource.put('3', todoItemHive);
        final List<TodoItemHive> result = await localDataSource.getAll();

        expect(result.length, 3);

        expect(result[2].name, 'ccc');
      });

      test('should call deleteAt check value return', () async {
        await box.putAll(items);

        await localDataSource.delete('1');
        final List<TodoItemHive> result = await localDataSource.getAll();

        expect(result.length, isNot(2));
        expect(result[0].name, 'b');
      });

      test('should call deleteAll check value return', () async {
        await box.putAll(items);

        await localDataSource.deleteAll();
        final List<TodoItemHive> result = await localDataSource.getAll();

        expect(result.length, isNot(2));
        expect(result.length, 0);
      });

      test('should call get check value return', () async {
        await box.putAll(items);

        final TodoItemHive? result = await localDataSource.get('1');

        expect(result?.name, 'a');
      });

      test('should call getAt check value return', () async {
        await box.putAll(items);

        final TodoItemHive? result = await localDataSource.getAt(0);

        expect(result?.name, 'a');
      });
    });
}