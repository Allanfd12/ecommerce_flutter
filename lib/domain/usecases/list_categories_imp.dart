import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/abstract_usecases/list_categories.dart';
import 'package:ecommerce_app/domain/entities/category.dart';
import 'package:ecommerce_app/domain/errors/failure_category.dart';
import 'package:ecommerce_app/infra/abstarct_repositories/category_repository.dart';

class ListCategoriesImp implements ListCategories {
  final CategoryRepository repository;

  ListCategoriesImp(this.repository);

  @override
  Future<Either<FailureCategory, List<Category>>> call() {
    return repository.getCategoryList();
  }
}
