
import 'package:doctor_g/pages/UserProfile.dart';
import 'package:doctor_g/pages/edit_profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_g/constant.dart';
import 'package:doctor_g/models/user.dart' as model;
import 'package:doctor_g/models/userProfile.dart' as model;
import 'package:doctor_g/pages/auth/login.dart';
import 'package:doctor_g/pages/HomePage.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.put(AuthController());
  late Rx<User?> _user;
  User get user => _user.value!;

  @override
  void onReady() {
    print("onready");
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    print("intial screen");
    if (user == null) {
      Get.offAll(() => Login());
    } else {
      //Get.offAll(() =>  EditProfilePage());
      Get.offAll(() =>  HomePage(uid:authController.user.uid));
    }
  }

  // registering the user
  void registerUser(String username, String email, String password) async {
    try {
      if ((username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty )) {
        // save out user to our ath and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());

      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        print("st");
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        print("k");
      } else {
        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Loggin gin',
        e.toString(),
      );
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }

  void editProfile(String username, String email, String phone,String age, String gender, String bloodgrp) async{
      try{
          //final DocumentReference documentReference= FirebaseFirestore.instance.collection("UserProfile").doc(authController.user.uid);
          model.UserProfile userProfile = model.UserProfile(
            name: username,
            email: email,
            phone: phone,
            age: age,
            bloodGrp: bloodgrp,
            gender: gender,
          );
          await firestore.collection('users').doc(authController.user.uid).collection('UserProfile').doc(user.uid).set(userProfile.toJson());

      }catch(e){
        Get.snackbar(
          'Please enter all the fields',
          e.toString(),
        );
      }

  }
}
