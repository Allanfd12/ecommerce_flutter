import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/category.dart';
import 'package:ecommerce_app/domain/repositories/category_repository.dart';
import 'package:ecommerce_app/domain/usecases/list_categories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'list_categories_test.mocks.dart';

class CategoryRepositoryMock extends Mock implements CategoryRepository {}

//flutter pub run  build_runner build --delete-conflicting-outputs
@GenerateMocks([CategoryRepositoryMock])
main() {
  final resitory = MockCategoryRepositoryMock();
  final usecase = ListCategoriesImp(resitory);

  test('usecase deve retornar uma List<Category>', () async {
    when(resitory.getCategotyList())
        .thenAnswer((_) async => const Right(<Category>[]));

    final result = await usecase();
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<Category>>());
  });
}
