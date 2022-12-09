import 'package:doctor_g/pages/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctor_g/utils/Routes.dart';
import 'package:get/get.dart';
import 'package:doctor_g/controllers/homePageController.dart';

class MyDrawer extends StatefulWidget {
  final String uid;
  MyDrawer({Key? key,required this.uid}) : super(key: key);
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final HomePageController homePageController = Get.put(HomePageController());
  @override
  void initState() {
    super.initState();
    homePageController.updateUserId(widget.uid);
  }
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Colors.teal[200],
      child: Container(
        color: Colors.white54,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Center(
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                  ),
                  margin: EdgeInsets.zero,
                  accountName:Text('Doctor G',style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),),
                  accountEmail: Text('Consult With Your Doctor,Online.',style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),),
                ),
              ),
            ),
            const SizedBox(height:20),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, Routes.homePageRoute);
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.blue,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(height:20),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, Routes.userProfileRoute);
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.blue,
                ),
                title: Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(height:20),
            GestureDetector(
              onTap: (){
                //Navigator.pushNamed(context, Routes.homePageRoute);
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.calendar,
                  color: Colors.blue,
                ),
                title: Text(
                  "My Appointments",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(height:20),
            Container(
              color: Colors.blue[200],
              child: GestureDetector(
                onTap: (){
                    FirebaseAuth.instance.signOut().then((value){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login())) ;
                  });
                },
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.lock_circle,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Logout",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}