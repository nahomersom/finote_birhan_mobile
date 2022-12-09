import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finote_birhan_mobile/repository/models/zemarian.dart';
import 'package:flutter/foundation.dart';
import '../models/category.dart';
import '../models/recomended.dart';
dynamic instance = FirebaseFirestore.instance;
class MezmursService{
Future<List<MezmurModel>> getRecommendedMezmurs([bool loadCachedData = false]) async {
  List<MezmurModel> recommendedList=[];
   dynamic recommend;
  try{
    if(loadCachedData){
       recommend = await instance.collection("mezmurs").get(const GetOptions(source: Source.cache));
    }else {
       recommend = await instance.collection("mezmurs")
          .get();
    }

    recommend.docs.forEach((element) {
      return recommendedList.add(MezmurModel.fromJSON(element.data()));
    });

    return recommendedList;
  }on FirebaseException catch(e){
    if (kDebugMode) {
      print('firebase problem ${e.code} and with message ${e.message}');
    }
    return recommendedList;
  }catch(e){
    throw Exception(e.toString());
  }
}

Future<List<CategoryModel>> getMezmursCategory([bool loadCachedData = false]) async{
  List<CategoryModel> categoryList=[];
  dynamic category;
  try{


    if(loadCachedData){
      category = await instance.collection("season")
          .where("category",isEqualTo: "መዝሙር").get(const GetOptions(source: Source.cache));
    }else {
   category =   await instance.collection("season")
          .where("category",isEqualTo: "መዝሙር")
          .get();
    }


    category.docs.forEach((element) {
      if (kDebugMode) {
        print('category and with message ${element.data()}');
      }
      return categoryList.add(CategoryModel.fromJSON(element.data()));
    });

    return categoryList;
  }on FirebaseException catch(e){
    if (kDebugMode) {
      print('firebase problem ${e.code} and with message ${e.message}');
    }
    return categoryList;
  }catch(e){
    throw Exception(e.toString());
  }
}

Future<List<CategoryModel>> getWerebCategory([bool loadCachedData = false]) async{
  List<CategoryModel> categoryList=[];
  dynamic category;
  try{
    if(loadCachedData){
      category = await FirebaseFirestore.instance.collection("season")
          .where("category",isEqualTo: "ወረብ")
          .get(const GetOptions(source: Source.cache));

    }else{
      category = await FirebaseFirestore.instance.collection("season")
          .where("category",isEqualTo: "ወረብ")
          .get();

    }

    category.docs.forEach((element) {
      if (kDebugMode) {
        print('category and with message ${element.data()}');
      }
      return categoryList.add(CategoryModel.fromJSON(element.data()));
    });

    return categoryList;
  }on FirebaseException catch(e){
    if (kDebugMode) {
      print('firebase problem ${e.code} and with message ${e.message}');
    }
    return categoryList;
  }catch(e){
    throw Exception(e.toString());
  }
}

Future<List<ZemarianModel>> getZemarian([bool loadCachedData = false]) async {
  List<ZemarianModel> zemarianList=[];
  dynamic zemarian;
  try{
    if(loadCachedData){
      zemarian = await FirebaseFirestore.instance.collection("zemarian").get((const GetOptions(source: Source.cache)));
    }else{
      zemarian = await FirebaseFirestore.instance.collection("zemarian").get();
    }


    zemarian.docs.forEach((element) {
      return zemarianList.add(ZemarianModel.fromJSON(element.data()));
    });

    return zemarianList;
  }on FirebaseException catch(e){
    if (kDebugMode) {
      print('firebase problem ${e.code} and with message ${e.message}');
    }
    return zemarianList;
  }catch(e){
    throw Exception(e.toString());
  }
}

}
