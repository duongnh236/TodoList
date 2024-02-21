// Mocks generated by Mockito 5.4.4 from annotations
// in fluttertemplate/test/home_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:fluttertemplate/src/core/helper/failure.dart' as _i7;
import 'package:fluttertemplate/src/data/source/local/models/todo_isar.dart'
    as _i5;
import 'package:fluttertemplate/src/domain/entities/activity_entity.dart'
    as _i8;
import 'package:fluttertemplate/src/domain/repositories/home_repository/home_repository.dart'
    as _i2;
import 'package:fpdart/fpdart.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;

import 'home_page_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHomeRepository_0 extends _i1.SmartFake
    implements _i2.HomeRepository {
  _FakeHomeRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MockHomeUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockHomeUseCase extends _i1.Mock implements _i3.MockHomeUseCase {
  MockMockHomeUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HomeRepository get homeRepository => (super.noSuchMethod(
        Invocation.getter(#homeRepository),
        returnValue: _FakeHomeRepository_0(
          this,
          Invocation.getter(#homeRepository),
        ),
      ) as _i2.HomeRepository);

  @override
  _i4.Future<List<_i5.TodoIsar?>> getTodoItemsLocal() => (super.noSuchMethod(
        Invocation.method(
          #getTodoItemsLocal,
          [],
        ),
        returnValue: _i4.Future<List<_i5.TodoIsar?>>.value(<_i5.TodoIsar?>[]),
      ) as _i4.Future<List<_i5.TodoIsar?>>);

  @override
  _i4.Future<bool> saveTodoItemsLocal(List<_i5.TodoIsar?>? items) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveTodoItemsLocal,
          [items],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> isHasData() => (super.noSuchMethod(
        Invocation.method(
          #isHasData,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<_i6.Either<_i7.Failure, _i8.Activity>> testApi() =>
      (super.noSuchMethod(
        Invocation.method(
          #testApi,
          [],
        ),
        returnValue: _i4.Future<_i6.Either<_i7.Failure, _i8.Activity>>.value(
            _i9.dummyValue<_i6.Either<_i7.Failure, _i8.Activity>>(
          this,
          Invocation.method(
            #testApi,
            [],
          ),
        )),
      ) as _i4.Future<_i6.Either<_i7.Failure, _i8.Activity>>);
}
