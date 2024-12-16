
import 'package:equatable/equatable.dart';
import 'package:stylish/data/models/product_model.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}


class AddToFavoriteEvent extends FavoriteEvent{
  final ProductModel product;
  const AddToFavoriteEvent(this.product);
    @override
  List<Object> get props => [product];
}

class RemoveFromFavoriteEvent extends FavoriteEvent{
   final ProductModel product;
   const RemoveFromFavoriteEvent(this.product);
     @override
  List<Object> get props => [product];
}

class ToggleFavoriteEvent extends FavoriteEvent {
  final ProductModel product;

 const ToggleFavoriteEvent(this.product);
   @override
  List<Object> get props => [product];
}