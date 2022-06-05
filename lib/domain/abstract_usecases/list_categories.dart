import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/category.dart';
import 'package:ecommerce_app/domain/errors/failure_category.dart';

abstract class ListCategories {
  Future<Either<FailureCategory, List<Category>>> call();
}
