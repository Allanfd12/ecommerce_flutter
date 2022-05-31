import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/domain/errors/failure_category.dart';
import 'package:ecommerce_app/external/datasources/laravel_category_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../utils/laravel_expected_server_response.dart';
import 'laravel_category_datasource_test.mocks.dart';

class DioMock extends Mock implements Dio {}

//flutter pub run  build_runner build --delete-conflicting-outputs
@GenerateMocks([DioMock])
main() {
  final dio = MockDioMock();
  final datasouce = LaravelCategoryDatasourceImp(dio);
  test('datasouce deve retornar uma List<CategoryModel>', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(laravelEspectedResponse),
        statusCode: 200,
        requestOptions: RequestOptions(path: "")));
    final Future? result = datasouce.listCategory();

    expect(result, completes);
  });
  test(
      'datasouce deve retornar um DatasourceError caso o statuscode não seja 200',
      () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: null, statusCode: 401, requestOptions: RequestOptions(path: "")));
    final Future? result = datasouce.listCategory();

    expect(result, throwsA(isA<DatasourceError>()));
  });
}
