import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:stylish/data/models/categories_model.dart';
import 'package:stylish/data/models/product_model.dart';

class FirestoreRepository {
  Future<List<CategoriesModel>> getCategories() async {
    List<CategoriesModel> categoriesList = [];
    try {
      final categories =
          await FirebaseFirestore.instance.collection('categories').get();
      categories.docs.forEach((element) {
        categoriesList.add(CategoriesModel.fromJson(element.data()));
      });

      return categoriesList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error'${e.code}':'${e.message}'");
      }
      return categoriesList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel>> getWomensData() async {
    List<ProductModel> getWomensDataList = [];
    try {
      final getWomensData = await FirebaseFirestore.instance
          .collection('categories')
          .doc('tNBypf19dQ7VQqx0vmL9')
          .collection('womens')
          .get();

      getWomensDataList = getWomensData.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print("Error fetching women's data: $e");
    }

    return getWomensDataList;
  }
}
