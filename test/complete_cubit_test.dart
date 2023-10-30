import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_item.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_state.dart';

void main() {
  late CompleteCubit completeCubit;
  late List<TodoItemHive> items;
  setUp(() {
    items = [TodoItemHive(isChecked: true, name: 'a'), TodoItemHive(isChecked: true, name: 'b'), TodoItemHive(isChecked: false, name: 'c')];

    completeCubit = CompleteCubit();
  });

  tearDown(() {
    completeCubit.close();
  });
  group('test function CompleteCubit', () {
    test('should initial state equals to CompleteInitial', () async {
      expect(completeCubit.state.runtimeType, CompleteInitial);
    });

    test('should call getItems return value have isChecked equal true', () {
      completeCubit.getItems(items: items);
      expect(completeCubit.state, CompleteInitial(items: [TodoItemHive(isChecked: true, name: 'a'), TodoItemHive(isChecked: true, name: 'b')]));

    });

    blocTest<CompleteCubit, CompleteState>('test CompleteCubit', build: () {
      return CompleteCubit();
    }, act: (cubit) => cubit.getItems(items: items), expect: () => [
      isA<CompleteInitial>()
    ]);
  });
}