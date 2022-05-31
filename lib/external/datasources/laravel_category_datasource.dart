import 'package:dio/dio.dart';
import 'package:ecommerce_app/infra/model/category_model.dart';

import '../../domain/errors/failure_category.dart';
import '../../infra/datasources/category_datasource.dart';

class LaravelCategoryDatasourceImp implements CategoryDatasource {
  final Dio dio;

  LaravelCategoryDatasourceImp(this.dio);

  @override
  Future<List<CategoryModel>> listCategory() async {
    final response = await dio.get("http://localhost:8000/api/categories");
    if (response.statusCode == 200) {
      final List<CategoryModel> list = (response.data["data"] as List)
          .map((e) => CategoryModel.fromMap(e))
          .toList();

      return list;
    } else {
      throw DatasourceError(
          menssage:
              "Falha na resposta do servidor, statuscode:${response.statusCode}");
    }
  }
}
