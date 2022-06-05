import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/abstract_usecases/list_categories.dart';
import 'package:ecommerce_app/domain/entities/category.dart';
import 'package:ecommerce_app/domain/errors/failure_category.dart';
import 'package:ecommerce_app/presenter/category/events/list_category_event.dart';
import 'package:ecommerce_app/presenter/category/list_category_bloc.dart';
import 'package:ecommerce_app/presenter/category/states/list_category_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'list_category_bloc_test.mocks.dart';

class ListCategoriesMock extends Mock implements ListCategories {}

//flutter pub run  build_runner build --delete-conflicting-outputs
@GenerateMocks([ListCategoriesMock])
main() {
  final usecase = MockListCategoriesMock();
  final bloc = ListCategoryBloc(usecase);

  test('deve retornar os estador na ordem correta, caso tudo ocorra bem', () {
    when(usecase.call()).thenAnswer((_) async => Right(<Category>[]));
    expect(bloc.stream, emitsInOrder([isA<ListLoading>(), isA<ListSuccess>()]));

    bloc.add(init());
  });

  test('deve retornar um estado de erro, caso haja problemas', () {
    when(usecase.call()).thenAnswer((_) async => Left(DatasourceError()));
    expect(bloc.stream, emitsInOrder([isA<ListLoading>(), isA<ListError>()]));

    bloc.add(init());
  });
}
