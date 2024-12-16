import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/favorite/favorite_event.dart';
import 'package:stylish/blocs/favorite/favorite_state.dart';
import 'package:stylish/data/models/product_model.dart';


class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
    final List<ProductModel> _favoriteItems = [];
  FavoriteBloc() : super(FavoriteInitial()) {
     on<AddToFavoriteEvent>((event, emit) {
      if (!_favoriteItems.contains(event.product)) {
        _favoriteItems.add(event.product);
        emit(FavoriteUpdated(List.from(_favoriteItems))); 
      }
    });

    on<RemoveFromFavoriteEvent>((event, emit) {
      _favoriteItems.remove(event.product);
      emit(FavoriteUpdated(List.from(_favoriteItems)));
    });

    on<ToggleFavoriteEvent>((event, emit) {
      if (_favoriteItems.contains(event.product)) {
        _favoriteItems.remove(event.product);
      } else {
        _favoriteItems.add(event.product);
      }
      emit(FavoriteUpdated(List.from(_favoriteItems)));
    });
  }
}
