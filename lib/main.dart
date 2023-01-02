import 'package:doctor_g/pages/DoctorDetailPage.dart';
import 'package:doctor_g/pages/category/CategoryDoctor.dart';
import 'package:doctor_g/pages/category/allCategory.dart';
import 'package:doctor_g/pages/searchBar.dart';
import 'package:doctor_g/pages/specialistProfile/AllSpecialist.dart';
import 'package:doctor_g/pages/specialistProfile/Profile.dart';
import 'package:doctor_g/widgets/specialistListHome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:doctor_g/pages/auth/login.dart';
import 'package:get/get.dart';
import 'package:doctor_g/pages/HomePage.dart';
import 'package:doctor_g/pages/UserProfile.dart';
import 'package:doctor_g/utils/Routes.dart';
import 'constant.dart';
import 'package:doctor_g/pages/ImageUpload.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Doctor());
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
}

class Doctor extends StatelessWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[200],
      ),
      initialRoute: "/",
      routes: {
        "/":(context) => HomePage(uid:authController.user.uid),
        //"/":(context) => Login(),
        Routes.homePageRoute: (context) => HomePage(uid:authController.user.uid),
        Routes.userProfileRoute: (context) => UserProfile(uid:authController.user.uid),
        Routes.imageUploadRoute: (context) => ImageUpload(),
        Routes.categoryDoctorRoute:(context) => CategoryDoctor(),
        Routes.doctorProfileRoute:(context) => DoctorProfile(),
        Routes.allCategoryRoute:(context) => AllCategory(),
        Routes.allSpecialistsRoute:(context) => AllSpecialists(),
        Routes.searchRoute:(context) => Search(),


      },


    );
  }
}