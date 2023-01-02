import 'package:doctor_g/constant.dart';
import 'dart:async';
import 'package:doctor_g/pages/HomePage.dart';
import 'package:doctor_g/pages/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  bool canResendEmail=false;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailVerified=FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailVerified){
      sendVerificationEmail();
      timer=Timer.periodic(Duration(seconds:5),(_)=>checkEmailVerified(),);
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer ?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified =FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if(isEmailVerified)timer?.cancel();
  }

  Future sendVerificationEmail() async{
    try{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(()=>canResendEmail=false);
      await Future.delayed(Duration(seconds:10));
      setState(()=>canResendEmail=true);

    }catch(e){
      print('Error occured');
    }

  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      //?HomePage(uid: authController.user.uid)
      ?EditProfilePage()
      : Scaffold(
          body: Padding(
            padding: EdgeInsets.all((16.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('A Verification Email has been sent to your Email Id',
              style: TextStyle(
                fontSize:18,
                fontWeight: FontWeight.w300,
                color: Colors.blue[700],
              ),
                  textAlign: TextAlign.center,
              ),
                SizedBox(height:25,),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  icon :Icon(Icons.email,size:32),
                  label:Text(
                    'Resend Email',style: TextStyle(fontSize:18,color: Colors.white,fontWeight: FontWeight.w300),
                  ) ,
                  onPressed:canResendEmail ? sendVerificationEmail:null,
                ),
                SizedBox(height:10,),
                TextButton(
                    onPressed: ()=>FirebaseAuth.instance.signOut(),
                    child:Text('Cancel',style: TextStyle(fontSize:18,color: Colors.blue,fontWeight: FontWeight.w300),),
                    style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50))),
              ],
            ),
          ),
        );
}
