import 'package:bloc/bloc.dart';
import 'package:stylish/blocs/womens_data/womens_data_event.dart';
import 'package:stylish/blocs/womens_data/womens_data_state.dart';
import 'package:stylish/data/models/product_model.dart';
import 'package:stylish/data/repositories/firebase_storage_repository.dart';

class WomensDataBloc extends Bloc<WomensDataEvent, WomensDataState> {
  WomensDataBloc() : super(WomensDataInitial()) {
    on<GetWomensData>((emits, event) async {
      emit(WomensDataLoading());
      await Future.delayed(const Duration(seconds: 1));

      try {
        final womensData = FirestoreRepository().getWomensData();
        emit(WomensDataLoaded(womensData));
      } catch (e) {
        emit(WomensDataError(e.toString()));
      }
      
    });
  }
}
