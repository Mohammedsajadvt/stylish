import 'package:bloc/bloc.dart';
import 'categories_event.dart';
import 'categories_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesLoading()) {
    on<LoadCategories>(_onLoadCategories);
  }

  Future<void> _onLoadCategories(
      LoadCategories event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());
    try {
      await Future.delayed(const Duration(seconds: 1)); // Simulate loading time
      final categories = [
        {
          'name': 'Beauty',
          'image':
              'https://img.freepik.com/free-photo/close-up-assortment-beauty-products_23-2148620111.jpg?ga=GA1.1.640607343.1733290149&semt=ais_hybrid'
        },
        {'name': 'Fashion', 'image': 'https://img.freepik.com/free-photo/girl-with-dazzling-smile-cute-mood-poses-photo-bright-warm-model-elegant-dress-puts-glasses_197531-12062.jpg?ga=GA1.1.640607343.1733290149&semt=ais_hybrid'},
        {'name': 'Kids', 'image': 'https://img.freepik.com/free-photo/cute-stylish-children-white-wall_155003-10577.jpg?ga=GA1.1.640607343.1733290149&semt=ais_hybrid'},
        {'name': 'Mens', 'image': 'https://img.freepik.com/free-photo/handsome-businessman-blue-suit-street-wearing-sunglasses_158538-10256.jpg?ga=GA1.1.640607343.1733290149&semt=ais_hybrid'},
        {'name': 'Womens', 'image': 'https://img.freepik.com/free-photo/city-lifestyle-fashion-portrait-happy-pretty-girl-walking-alone-having-fun-street-evening-sunlight-retro-dress-vintage-hat-happy-positive-mood_291049-2455.jpg?ga=GA1.1.640607343.1733290149&semt=ais_hybrid'},
      ];
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
