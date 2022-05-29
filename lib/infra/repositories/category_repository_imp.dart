import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/category.dart';
import 'package:ecommerce_app/domain/errors/failure_category.dart';
import 'package:ecommerce_app/infra/datasources/category_datasource.dart';

import '../../domain/repositories/category_repository.dart';

class CategoriesRepositoryImp implements CategoryRepository {
  final CategoryDatasource datasource;

  CategoriesRepositoryImp(this.datasource);

  @override
  Future<Either<FailureCategory, List<Category>>> getCategotyList() async {
    try {
      final result = await datasource.listCategory();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
