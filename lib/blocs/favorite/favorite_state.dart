
import 'package:equatable/equatable.dart';
import 'package:stylish/data/models/product_model.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
  
  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteUpdated extends FavoriteState{
  final List<ProductModel> favorite;
  const FavoriteUpdated(this.favorite);
  
  @override
  List<Object> get props => [favorite];
}


