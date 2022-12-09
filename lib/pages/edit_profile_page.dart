import 'package:doctor_g/constant.dart';
import 'package:doctor_g/pages/HomePage.dart';
import 'package:flutter/material.dart';


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _bloodgrpController = TextEditingController();

  //UserProfile user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Builder(
          builder: (context) => Scaffold(
            appBar:  AppBar(
              leading: BackButton(color: Colors.blue,),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text("   Complete Your Profile",style: TextStyle(color: Colors.black),),
            ),
            bottomSheet:GestureDetector(
              onTap: (){
                authController.editProfile(
                  _userNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _ageController.text,
                  _genderController.text,
                  _bloodgrpController.text
                );
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomePage(uid: authController.user.uid)));
              },
              child:  Container(
                height: 50,
                width: double.infinity,
                child: Container(
                  color: Colors.blue[200],
                  child:Center(
                    child: Text("Save Changes",
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
              padding: EdgeInsets.symmetric(horizontal:20),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                // ProfileWidget(
                //   imagePath: user.name,
                //   isEdit: true,
                //   onClicked: () async {},
                // ),
                const SizedBox(height:12),
                TextField(
                  //label: 'Full Name',
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                  ),
                  //onChanged: (name) {},
                ),
                //const SizedBox(height:12),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "User Email",
                  ),
                  //onChanged: (email) {},
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: "Phone",
                  ),
                  //onChanged: (phone) {},
                ),
                TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    labelText: "Age",
                  ),
                  //onChanged: (age) {},
                ),
                TextField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    labelText: "gender",
                  ),
                  //onChanged: (gender) {},
                ),
                TextField(
                  controller: _bloodgrpController,
                  decoration: InputDecoration(
                    labelText: "Blood group",
                  ),
                  //onChanged: (bloodgrp) {},
                ),
              ],
            ),
          ),
        ),
      );
}
