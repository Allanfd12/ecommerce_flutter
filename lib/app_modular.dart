import 'package:dio/dio.dart';
import 'package:ecommerce_app/domain/repositories/category_repository.dart';
import 'package:ecommerce_app/domain/usecases/list_categories.dart';
import 'package:ecommerce_app/external/datasources/laravel_category_datasource.dart';
import 'package:ecommerce_app/infra/datasources/category_datasource.dart';
import 'package:ecommerce_app/infra/repositories/category_repository_imp.dart';
import 'package:ecommerce_app/presenter/category/list_category_bloc.dart';
import 'package:ecommerce_app/presenter/category/list_category_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<Dio>((i) => Dio()),
        Bind<ListCategories>((i) => ListCategoriesImp(i())),
        Bind<CategoryRepository>((i) => CategoriesRepositoryImp(i())),
        Bind<CategoryDatasource>((i) => LaravelCategoryDatasourceImp(i())),
        Bind<ListCategoryBloc>((i) => ListCategoryBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const ListCategoryPage(),
        )
      ];
}
