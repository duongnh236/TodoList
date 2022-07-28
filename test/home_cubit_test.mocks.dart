// Mocks generated by Mockito 5.2.0 from annotations
// in fluttertemplate/test/home_cubit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart'
    as _i5;
import 'package:fluttertemplate/src/domain/repositories/home_repository/home_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'home_cubit_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeHomeRepository_0 extends _i1.Fake implements _i2.HomeRepository {}

/// A class which mocks [MockHomeUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockHomeUseCase extends _i1.Mock implements _i3.MockHomeUseCase {
  MockMockHomeUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HomeRepository get homeRepository =>
      (super.noSuchMethod(Invocation.getter(#homeRepository),
          returnValue: _FakeHomeRepository_0()) as _i2.HomeRepository);
  @override
  _i4.Future<List<_i5.ToDoItemEntity>> getTodoItemsLocal() =>
      (super.noSuchMethod(Invocation.method(#getTodoItemsLocal, []),
          returnValue: Future<List<_i5.ToDoItemEntity>>.value(
              <_i5.ToDoItemEntity>[])) as _i4.Future<List<_i5.ToDoItemEntity>>);
  @override
  _i4.Future<bool> saveTodoItemsLocal(List<_i5.ToDoItemEntity>? items) =>
      (super.noSuchMethod(Invocation.method(#saveTodoItemsLocal, [items]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<bool> isHasData() =>
      (super.noSuchMethod(Invocation.method(#isHasData, []),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}
