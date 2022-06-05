import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/category.dart';
import 'package:ecommerce_app/domain/errors/failure_category.dart';
import 'package:ecommerce_app/external/abstract_datasources/category_datasource.dart';
import 'package:ecommerce_app/external/model/category_model.dart';
import 'package:ecommerce_app/infra/repositories/category_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'category_repository_imp_test.mocks.dart';

class CategoryDatasourceMock extends Mock implements CategoryDatasource {}

//flutter pub run  build_runner build --delete-conflicting-outputs
@GenerateMocks([CategoryDatasourceMock])
main() {
  final datasouce = MockCategoryDatasourceMock();
  final repository = CategoriesRepositoryImp(datasouce);
  test('repository deve retornar uma List<Category>', () async {
    when(datasouce.listCategory()).thenAnswer((_) async => <CategoryModel>[]);

    final result = await repository.getCategoryList();

    expect(result.fold(id, id), isA<List<Category>>());
  });

  test('repository deve retornar um DatasourceError caso o datasource falhe',
      () async {
    when(datasouce.listCategory()).thenThrow(Exception());

    final result = await repository.getCategoryList();

    expect(result.fold(id, id), isA<DatasourceError>());
  });
  test(
      'repository deve manter o mesmo DatasourceError caso o datasource forneça um DatasourceError',
      () async {
    final DatasourceError erro = new DatasourceError();
    when(datasouce.listCategory()).thenThrow(erro);

    final result = await repository.getCategoryList();

    expect(result.fold(id, id), erro);
  });
}
