import 'package:ecommerce_app/external/model/category_model.dart';

abstract class CategoryDatasource {
  Future<List<CategoryModel>> listCategory();
}
