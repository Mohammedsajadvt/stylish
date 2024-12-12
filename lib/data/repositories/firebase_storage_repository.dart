import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:stylish/data/models/categories_model.dart';

class FirestoreRepository {
  Future<List<CategoriesModel>> getCategories() async {
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
}
