import 'package:bloc/bloc.dart';
import 'package:stylish/data/repositories/firebase_storage_repository.dart';
import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  

  CategoriesBloc() : super(CategoriesLoading()) {
    on<LoadCategories>(_onLoadCategories);
  }

  Future<void> _onLoadCategories(
      LoadCategories event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());
    try {
      FirestoreRepository firestoreRepository = FirestoreRepository();
      firestoreRepository.getProducts().listen((categories) {
        emit(CategoriesLoaded(categories));
      });
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
