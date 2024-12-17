import 'package:flutter/foundation.dart';
import 'package:stylish/utils/index.dart';

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

  Future<List<ProductModel>> getMensData() async {
    List<ProductModel> getMensDataList = [];
    try {
      final getMensData = await FirebaseFirestore.instance
          .collection('categories')
          .doc('32HAp54qkebJHhDlc7QD')
          .collection('mens')
          .get();

      getMensDataList = getMensData.docs.map((doc)=>ProductModel.fromJson(doc.data())).toList();    
    } catch (e) {
      print("Error fetching men's data: $e");
    }
    return getMensDataList;
  }
  Future<List<ProductModel>> getFootwareData()async{
    List<ProductModel> getFootwareDataList = [];
    try{
    final getFootwareData = await FirebaseFirestore.instance.collection('categories').doc('FgzUoYyzWEqPqBhur7Gm').collection('footware').get();
    getFootwareDataList = getFootwareData.docs.map((doc)=> ProductModel.fromJson(doc.data())).toList(); 
    }catch(e){
      print("Error fetching footware data: $e");

    }
    return getFootwareDataList;
  }
  Future<List<ProductModel>> getWatchData()async{
    List<ProductModel> getWatchDataList = [];
    try{
    final getWatchData = await FirebaseFirestore.instance.collection('categories').doc('RINgcwIoz3Sn4pJFu6Eg').collection('watch').get();
    getWatchDataList = getWatchData.docs.map((doc)=> ProductModel.fromJson(doc.data())).toList(); 
    }catch(e){
      print("Error fetching footware data: $e");

    }
    return getWatchDataList;
  }
  Future<List<ProductModel>> getBeautyData()async{
    List<ProductModel> getBeautyDataList = [];
    try{
    final getBeautyData = await FirebaseFirestore.instance.collection('categories').doc('W1PCRAKoLlDPjbi39kYS').collection('beauty').get();
    getBeautyDataList = getBeautyData.docs.map((doc)=> ProductModel.fromJson(doc.data())).toList(); 
    }catch(e){
      print("Error fetching footware data: $e");

    }
    return getBeautyDataList;
  }
}
