import 'package:ecommerce_app/domain/entities/category.dart';
import 'package:ecommerce_app/domain/errors/failure_category.dart';

abstract class ListCategoryState {}

class ListStart implements ListCategoryState {}

class ListLoading implements ListCategoryState {}

class ListSuccess implements ListCategoryState {
  final List<Category> list;

  ListSuccess(this.list);
}

class ListError implements ListCategoryState {
  final FailureCategory erro;

  ListError(this.erro);
}
