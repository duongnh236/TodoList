import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_item.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_state.dart';

void main() {
  late IncompleteCubit incompleteCubit;
  late List<TodoItemHive> items;
  setUp(() {
     items = [TodoItemHive(isChecked: true, name: 'a'), TodoItemHive(isChecked: true, name: 'a'), TodoItemHive(isChecked: false, name: 'a')];

    incompleteCubit = IncompleteCubit();
  });

  tearDown(() {
    incompleteCubit.close();
  });
  group('test function IncompleteCubit', () {
    test('should initial state equals to IncompleteCubit', () async {
      expect(incompleteCubit.state.runtimeType, IncompleteInitial);
    });

    test('should call getItems return value have isChecked equal false', () {
      incompleteCubit.getItems(items: items);
      expect(incompleteCubit.state, IncompleteInitial(items: [TodoItemHive(isChecked: false, name: 'a')]));

    });

    blocTest<IncompleteCubit, IncompleteState>('test IncompleteCubit', build: () {
      return IncompleteCubit();
    }, act: (cubit) => cubit.getItems(items: items), expect: () => [
      isA<IncompleteInitial>()
    ]);
  });
}