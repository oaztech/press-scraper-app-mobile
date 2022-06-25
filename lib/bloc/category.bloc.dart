import 'package:bloc/bloc.dart';
import 'package:scrapi/client/hespress_scraper.client.dart';
import 'package:scrapi/model/category.model.dart';

abstract class CategoryEvent {}

class FetchCategoriesEvent extends CategoryEvent {}

// State
abstract class CategoryState {
  final List<CategoryModel> categories;

  const CategoryState({required this.categories});
}

class CategoryInitialState extends CategoryState {
  CategoryInitialState() : super(categories: []) {
    
  }
}

class CategorySuccessState extends CategoryState {
  CategorySuccessState({required List<CategoryModel> categories})
      : super(categories: categories);
}
// Bloc

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitialState()) {
    on((FetchCategoriesEvent event, emit) async {
      List<CategoryModel> categories =
          await HespressScraperClient.fetchCategories();

      emit(CategorySuccessState(categories: categories));
    });
  }
}
