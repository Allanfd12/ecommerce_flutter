import 'dart:convert';

import 'package:dartz/dartz.dart' hide Bind;
import 'package:dio/dio.dart';
import 'package:ecommerce_app/app_modular.dart';
import 'package:ecommerce_app/domain/abstract_usecases/list_categories.dart';
import 'package:ecommerce_app/domain/entities/category.dart';
import 'package:ecommerce_app/external/abstract_datasources/category_datasource.dart';
import 'package:ecommerce_app/infra/abstract_repositories/category_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'app_modular_test.mocks.dart';
import 'utils/laravel_expected_server_response.dart';

class DioMock extends Mock implements Dio {}

//flutter pub run  build_runner build --delete-conflicting-outputs
@GenerateMocks([DioMock])
main() {
  final dio = MockDioMock();

  initModule(AppModule(), replaceBinds: [Bind<Dio>((i) => dio)]);

  test('Deve recuperar o usecase sem erro', () {
    final usecase = Modular.get<ListCategories>();
    expect(usecase, isA<ListCategories>());
  });
  test('Deve recuperar o repository sem erro', () {
    final repository = Modular.get<CategoryRepository>();
    expect(repository, isA<CategoryRepository>());
  });
  test('Deve recuperar o datasource sem erro', () {
    final datasource = Modular.get<CategoryDatasource>();
    expect(datasource, isA<CategoryDatasource>());
  });
  test('Deve trazer uma lista de Category', () async {
    final usecase = Modular.get<ListCategories>();
    final result = await usecase();
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(laravelEspectedResponse),
        statusCode: 200,
        requestOptions: RequestOptions(path: "")));
    expect(result.fold(id, id), isA<List<Category>>());
  });
}
