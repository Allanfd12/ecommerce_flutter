import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/category.dart';
import 'package:ecommerce_app/domain/errors/failure_category.dart';
import 'package:ecommerce_app/domain/repositories/category_repository.dart';

abstract class ListCategories {
  Future<Either<FailureCategory, List<Category>>> call();
}

class ListCategoriesImp implements ListCategories {
  final CategoryRepository repository;

  ListCategoriesImp(this.repository);

  @override
  Future<Either<FailureCategory, List<Category>>> call() {
    return repository.getCategotyList();
  }
}
