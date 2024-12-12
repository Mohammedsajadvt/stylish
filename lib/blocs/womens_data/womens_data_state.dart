
import 'package:equatable/equatable.dart';
import 'package:stylish/data/models/product_model.dart';

abstract class WomensDataState extends Equatable {
  const WomensDataState();
  
  @override
  List<Object> get props => [];
}

class WomensDataInitial extends WomensDataState {}


class WomensDataLoading extends WomensDataState{}


class WomensDataLoaded extends WomensDataState{
  Future<List<ProductModel>> productData;
  WomensDataLoaded(this.productData);
  
  @override
  List<Object> get props => [productData];
}

class WomensDataError extends WomensDataState {
  final String message;

  const WomensDataError(this.message);

  @override
  List<Object> get props => [message];
}
