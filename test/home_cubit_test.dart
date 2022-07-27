import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/domain/use_case/home_usecase/home_usercase.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_cubit_test.mocks.dart';

class MockHomeUseCase extends Mock implements HomeUseCase {}

@GenerateMocks([MockHomeUseCase])
void main() {
  late HomeCubit homeCubit;
  late MockMockHomeUseCase mockHomeUseCase;

  setUp(() {
    mockHomeUseCase = MockMockHomeUseCase();
    homeCubit = HomeCubit(mockHomeUseCase);

    homeCubit.items = [ToDoItemEntity(name: 'a', isChecked: true),ToDoItemEntity(name: 'b', isChecked: false)];

  });

  tearDown(() {
    homeCubit.close();
  });

  test('should initial state equals to HomeInitialState', () async {
    expect(homeCubit.state.runtimeType, HomeInitialState);
  });

  group('homeCubit test getTodoItemsLocal()', () {
    test('Should call getTodoItemsLocal when isHasData return true', () {
      when(mockHomeUseCase.isHasData()).thenReturn(true);
      when(mockHomeUseCase.getTodoItemsLocal()).thenReturn([
        ToDoItemEntity(isChecked: true, name: 'aaa'),
        ToDoItemEntity(isChecked: true, name: 'bbb')
      ]);
      homeCubit.getTodoItems();
      expect(homeCubit.items.length, 2);
      expect(homeCubit.state.runtimeType, HomeHandleStatusItemState);
    });

    test('Should call getTodoItemsLocal when isHasData return false', () {
      when(mockHomeUseCase.isHasData()).thenReturn(false);
      when(mockHomeUseCase.getTodoItemsLocal()).thenReturn([
        ToDoItemEntity(isChecked: true, name: 'aaa'),
        ToDoItemEntity(isChecked: true, name: 'bbb')
      ]);
      homeCubit.getTodoItems();
      expect(homeCubit.items.length, 0);
      expect(homeCubit.state.runtimeType, HomeHandleStatusItemState);
    });
  });
  group('homeCubit test createTask()', () {
    test('Should call createTask when isSave return true', () {
      when(mockHomeUseCase.saveTodoItemsLocal(any)).thenReturn(true);
      homeCubit.createTask(taskName: 'eqqq');
      expect(homeCubit.state.runtimeType, HomeHandleStatusItemState);
      verify(mockHomeUseCase.saveTodoItemsLocal(any)).called(1);
    });

    test('Should call createTask when saveTodoItemsLocal return false', () {
      when(mockHomeUseCase.saveTodoItemsLocal(any)).thenReturn(false);
      homeCubit.createTask(taskName: 'eqqq');
      expect(homeCubit.state.runtimeType, HomeErrorState);
      verify(mockHomeUseCase.saveTodoItemsLocal(any)).called(1);
    });
  });

  group('homeCubit test handleTodoList()', () {

    test('Should call handleTodoList when homeUserCase.saveTodoItemsLocal return true', () {
      when(mockHomeUseCase.saveTodoItemsLocal(any)).thenReturn(true);
      homeCubit.handleTodoList(index: 0);
      expect(homeCubit.state.runtimeType, HomeHandleStatusItemState);
      verify(mockHomeUseCase.saveTodoItemsLocal(any)).called(1);
    });

    test('Should call handleTodoList when homeUserCase.saveTodoItemsLocal return false', () {
      when(mockHomeUseCase.saveTodoItemsLocal(any)).thenReturn(false);
      homeCubit.handleTodoList(index: 0);
      expect(homeCubit.state.runtimeType, HomeErrorState);
      verify(mockHomeUseCase.saveTodoItemsLocal(any)).called(1);
    });

    test('Should call handleTodoList when pass index: 0 return isChecked false', () {
      when(mockHomeUseCase.saveTodoItemsLocal(any)).thenReturn(false);
      homeCubit.handleTodoList(index: 0);
      expect(homeCubit.items[0].isChecked, false);
    });

  });
}
