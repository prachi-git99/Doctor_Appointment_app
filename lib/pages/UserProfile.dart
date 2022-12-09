import 'package:doctor_g/controllers/authController.dart';
import 'package:doctor_g/controllers/userProfileController.dart';
import 'package:doctor_g/models/userProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:doctor_g/pages/edit_profile_page.dart';
import 'package:doctor_g/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatefulWidget {
  final String uid;
  UserProfile({Key? key,required this.uid}) : super(key: key);
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  final UserProfileController userProfileController = Get.put(UserProfileController());
  @override
  void initState() {
    super.initState();
    userProfileController.updateUserId(widget.uid);
  }
  @override
  Widget build(BuildContext context) {

    return GetBuilder<UserProfileController>(
      init:UserProfileController(),
      builder:  (controller) {
        return Scaffold(
          body: Builder(
            builder: (context) =>
                Scaffold(
                  backgroundColor: Colors.white30,
                  appBar: AppBar(
                    leading: BackButton(color: Colors.blue,),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  bottomSheet:GestureDetector(
                    onTap: (){

                    },
                    child:  Container(
                      // decoration:BoxDecoration(
                      //   image: DecorationImage(
                      //     image: NetworkImage('https://images.pexels.com/photos/2904142/pexels-photo-2904142.jpeg?auto=compress&cs=tinysrgb&w=1600'),
                      //     fit: BoxFit.cover,
                      //   )
                      // ),
                      height: 50,
                      width: double.infinity,
                      child: Container(
                        color: Colors.blue[200],
                        child:Center(
                          child: Text("Upload Your Reports",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  body: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      ProfileWidget(
                        imagePath: "https://cdn-icons-png.flaticon.com/512/3177/3177440.png",
                        onClicked: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage()),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      Column(
                        children: [
                          Text(
                            controller.userProfile['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 24),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            controller.userProfile['email'],
                            style: TextStyle(color: Colors.blue[400],fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 14),
                          Container(
                            margin: EdgeInsets.only(top:10,right:20,left: 20),
                            width: double.infinity,
                            height:70,
                            child: Card(
                              elevation: 10,
                              shadowColor: Colors.grey,
                              child:Center(
                                child: Text(
                                  'Phone:${controller.userProfile['phone']}',
                                  style: TextStyle(color: Colors.black,fontSize:16,fontWeight: FontWeight.w400),
                                ),
                              ) ,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.only(top:10,right:20,left: 20),
                            width: double.infinity,
                            height:70,
                            child: Card(
                              elevation: 10,
                              shadowColor: Colors.grey,
                              child:Center(
                                child: Text(
                                  'Age: ${controller.userProfile['age']}',
                                  style: TextStyle(color: Colors.black,fontSize:16,fontWeight: FontWeight.w400),
                                ),
                              ) ,
                            ),
                          ),
                          const SizedBox(height: 10),

                          Container(
                            margin: EdgeInsets.only(top:10,right:20,left: 20),
                            width: double.infinity,
                            height:70,
                            child: Card(
                              elevation: 10,
                              shadowColor: Colors.grey,
                              child:Center(
                                child: Text(
                                  'Gender:${controller.userProfile['gender']}',
                                  style: TextStyle(color: Colors.black,fontSize:16,fontWeight: FontWeight.w400),
                                ),
                              ) ,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.only(top:10,right:20,left: 20),
                            width: double.infinity,
                            height:70,
                            child: Card(
                              elevation: 10,
                              shadowColor: Colors.grey,
                              child:Center(
                                child: Text(
                                  'Blood Group: ${controller.userProfile['bloodGrp']}',
                                  style: TextStyle(color: Colors.black,
                                      fontSize:16,fontWeight: FontWeight.w400),
                                ),
                              ) ,
                            ),
                          ),
                        ],
                      ), const SizedBox(height: 24),

                      const SizedBox(height: 48),

                    ],
                  ),
                ),
          ),
        );
      },
    );
  }
}


