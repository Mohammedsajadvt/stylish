import 'package:bloc/bloc.dart';
import 'package:stylish/data/repositories/firebase_storage_repository.dart';
import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(InitialState()) {
    on<GetCategories>((emits, event) async {
      emit(CategoriesLoading());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final data = await FirestoreRepository().getCategories();
        emit(CategoriesLoaded(data));
      } catch (e) {
        emit(CategoriesError(e.toString()));
      }
    });
  }
}
