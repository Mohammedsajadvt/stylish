
import 'package:equatable/equatable.dart';
import 'package:stylish/data/models/product_model.dart';

abstract class ProductDataState extends Equatable {
  const ProductDataState();
  
  @override
  List<Object> get props => [];
}

class ProductDataInitial extends ProductDataState {}


class ProductDataLoading extends ProductDataState{}


class ProductDataLoaded extends ProductDataState{
List<ProductModel> productData;
  ProductDataLoaded(this.productData);
  
  @override
  List<Object> get props => [productData];
}

class ProductDataError extends ProductDataState {
  final String message;

  const ProductDataError(this.message);

  @override
  List<Object> get props => [message];
}
