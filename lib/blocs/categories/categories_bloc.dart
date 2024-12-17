import 'package:stylish/utils/index.dart';

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
