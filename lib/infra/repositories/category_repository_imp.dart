import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/category.dart';
import 'package:ecommerce_app/domain/errors/failure_category.dart';
import 'package:ecommerce_app/external/abstract_datasources/category_datasource.dart';
import 'package:ecommerce_app/infra/abstract_repositories/category_repository.dart';

class CategoriesRepositoryImp implements CategoryRepository {
  final CategoryDatasource datasource;

  CategoriesRepositoryImp(this.datasource);

  @override
  Future<Either<FailureCategory, List<Category>>> getCategoryList() async {
    try {
      final result = await datasource.listCategory();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError(
          message: "Ocorreu um problema na comunicaçao com o servidor"));
    }
  }
}
