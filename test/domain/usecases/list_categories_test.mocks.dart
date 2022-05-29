// Mocks generated by Mockito 5.2.0 from annotations
// in ecommerce_app/test/domain/usecases/list_categories_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ecommerce_app/domain/entities/category.dart' as _i6;
import 'package:ecommerce_app/domain/errors/failure_category.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

import 'list_categories_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [CategoryRepositoryMock].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoryRepositoryMock extends _i1.Mock
    implements _i3.CategoryRepositoryMock {
  MockCategoryRepositoryMock() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.FailureCategory, List<_i6.Category>>>
      getCategotyList() => (super.noSuchMethod(
              Invocation.method(#getCategotyList, []),
              returnValue:
                  Future<_i2.Either<_i5.FailureCategory, List<_i6.Category>>>.value(
                      _FakeEither_0<_i5.FailureCategory, List<_i6.Category>>()))
          as _i4.Future<_i2.Either<_i5.FailureCategory, List<_i6.Category>>>);
}
