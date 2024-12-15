import 'package:bloc/bloc.dart';
import 'package:stylish/blocs/products/product_data_event.dart';
import 'package:stylish/blocs/products/product_data_state.dart';
import 'package:stylish/data/models/product_model.dart';
import 'package:stylish/data/repositories/firebase_storage_repository.dart';

class ProductDataBloc extends Bloc<ProductDataEvent, ProductDataState> {
  ProductDataBloc() : super(ProductDataInitial()) {
    on<GetWomensData>((emits, event) async {
      emit(ProductDataLoading());
      await Future.delayed(const Duration(seconds: 1));

      try {
        final List<ProductModel> womensData = await FirestoreRepository().getWomensData();
        emit(ProductDataLoaded(womensData));
      } catch (e) {
        emit(ProductDataError(e.toString()));
      }
      
    });
    on<GetmensData>((event, emit)async {
      emit(ProductDataLoading());
      await Future.delayed(const Duration(seconds: 1));

      try{
       final List<ProductModel> mensData = await FirestoreRepository().getMensData();
       emit(ProductDataLoaded(mensData));
      }catch(e){
      emit(ProductDataError(e.toString()));
      }
    },);
  }
}
