import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:stylish/data/models/categories_model.dart';
import 'package:stylish/data/models/product_model.dart';

class FirestoreRepository {
   getCategories() async {
    List<CategoriesModel> categoriesList = [];
    try {
      final categories =
          await FirebaseFirestore.instance.collection('categories').get();
      categories.docs.forEach((element) {
        return categoriesList.add(CategoriesModel.fromJson(element.data()));
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

    getWomensData() async {
    List<ProductModel> getWomensDataList = [];
    try {
      final getWomensData = await FirebaseFirestore.instance
          .collection('categories')
          .doc('tNBypf19dQ7VQqx0vmL9')
          .get();

      if (getWomensData.exists) {
        List<dynamic> womens = getWomensData.data()?['womens'] ?? [];
        for (var womens in womens) {
          getWomensDataList.add(ProductModel.fromJson(womens));
        }
      }
    } catch (e) {
      print("Error fetching women's data: $e");
    }

    return getWomensDataList;
  }
}
