import 'package:ecommerce_app/infra/model/category_model.dart';

abstract class CategoryDatasource {
  Future<List<CategoryModel>> listCategory();
}
