import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_g/constant.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController{
  final Rx<Map<String,dynamic>> _user = Rx<Map<String,dynamic>> ({});
  Map<String,dynamic> get user=> _user.value;

  //create a uid
  Rx<String> _uid="".obs;//making it observable so that chnage later
  //method for userid
  updateUserId(String uid){
    _uid.value=uid;
    getUserData();
  }
  getUserData()async{
    DocumentSnapshot userDoc = await firestore.collection('users').doc(_uid.value).get();
    //here store the name
    final userData = userDoc.data()! as dynamic;
    String name = userData['name'];
    String email=userData['email'];
    //we got this from firbase
    _user.value={
      'name':name,
      'email':email,
    };
    update();
  }
}