import 'package:stylish/utils/index.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  WishlistBloc() : super(WishlistInitial()) {
    on<AddProductToWishlist>((event, emit) async {
      await _firestore.collection('wishlist').add({
        'name': event.product.name,
        'description': event.product.description,
        'image': event.product.image,
        'price': event.product.price,
        'rating': event.product.rating,
      });

      emit(WishlistLoaded(await _fetchWishlistFromFirebase()));
    });

    on<RemoveProductFromWishlist>((event, emit) async {
      await _firestore
          .collection('wishlist')
          .where('name', isEqualTo: event.product.name)
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });

      emit(WishlistLoaded(await _fetchWishlistFromFirebase()));
    });

    on<FetchWishlist>((event, emit) async {
      emit(WishlistLoading());
      emit(WishlistLoaded(await _fetchWishlistFromFirebase()));
    });
  }

  Future<List<ProductModel>> _fetchWishlistFromFirebase() async {
    final snapshot = await _firestore.collection('wishlist').get();
    return snapshot.docs.map((doc) {
      return ProductModel.fromJson(doc.data());
    }).toList();
  }
}
