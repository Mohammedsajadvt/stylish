import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Map<String, dynamic> productData) async {
    try {
      await _firestore.collection('categories').add(productData);
    } catch (e) {
      print('Error adding product: $e');
    }
  }

  Stream<List<Map<String, dynamic>>> getProducts() {
    return _firestore.collection('categories').snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
    );
  }
}
