import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/abstract_usecases/list_categories.dart';
import 'package:ecommerce_app/presenter/category/events/list_category_event.dart';
import 'package:ecommerce_app/presenter/category/states/list_category_state.dart';

class ListCategoryBloc extends Bloc<ListCategoryEvent, ListCategoryState> {
  final ListCategories usercase;
  ListCategoryBloc(this.usercase) : super(ListStart()) {
    on<init>((event, emit) async {
      emit(ListLoading());
      final result = await usercase();
      emit(result.fold((l) => ListError(l), (r) => ListSuccess(r)));
    });
  }
}
