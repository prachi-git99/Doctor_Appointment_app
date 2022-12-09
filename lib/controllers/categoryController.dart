
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_g/constant.dart';
import 'package:doctor_g/models/category.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  final Rx<List<Category>> _categoryList = Rx<List<Category>>([]);

  List<Category> get categoryList => _categoryList.value;
  
  @override
  void onInit() {
    super.onInit();
    _categoryList.bindStream(firestore.collection('categories').snapshots().map((QuerySnapshot query){
      List<Category> retVal = [];
      for(var element in query.docs){
        retVal.add(Category.fromSnap(element));
      }
      return retVal;
    }));
  }
  
}