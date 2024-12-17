import 'package:equatable/equatable.dart';
import 'package:stylish/data/models/product_model.dart';

abstract class WishlistEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddProductToWishlist extends WishlistEvent {
  final ProductModel product;

  AddProductToWishlist(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromWishlist extends WishlistEvent {
  final ProductModel product;

  RemoveProductFromWishlist(this.product);

  @override
  List<Object> get props => [product];
}


class FetchWishlist extends WishlistEvent {}

