import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_g/constant.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController{
  final Rx<Map<String,dynamic>> _userProfile = Rx<Map<String,dynamic>> ({});
  Map<String,dynamic> get userProfile=> _userProfile.value;

  //create a uid
  Rx<String> _uid="".obs;//making it observable so that chnage later
  //method for userid
  updateUserId(String uid){
    _uid.value=uid;
    getUserData();
  }
  getUserData()async{
    DocumentSnapshot userDoc = await firestore.collection('users').doc(authController.user.uid).collection('UserProfile').doc(authController.user.uid).get();
    //here store the name
    final userData = userDoc.data()! as dynamic;
    String name = userData['name'];
    String email=userData['email'];
    String phone=userData['phone'];
    String age = userData['age'];
    String gender=userData['gender'];
    String bloodGrp=userData['bloodGrp'];
    //we got this from firbase
    _userProfile.value={
      "name":name,
      "email":email,
      "phone":phone,
      'age':age,
      'gender':gender,
      'bloodGrp':bloodGrp,
    };
    update();
  }
}

