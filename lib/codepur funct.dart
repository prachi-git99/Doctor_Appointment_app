import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_g/constant.dart';


class codepur{
  String myText="";
  final DocumentReference documentReference= FirebaseFirestore.instance.collection("adding").doc(authController.user.uid);

  void add(){
    Map<String,String> data= <String,String>{
      "name":"prachi ",
      "desc":"flutter dev",
      "one":"two"
    };
    documentReference.set(data).whenComplete((){
      print("document added");
    }).catchError((e)=>print(e));
  }
  void update(){
    Map<String,String> data= <String,String>{
      "name":"prachi ",
      "desc":"flutter dev",
      "one":"two"
    };
    documentReference.update(data).whenComplete((){
      print("document updated");
    }).catchError((e)=>print(e));
  }
  void fetch(){
    documentReference.get().then((datasnapshot){
      if(datasnapshot.exists)
        {

          //myText = datasnapshot.data[''];
        }
    });
  }
}


