import 'package:flutter/material.dart';


class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 250),
        height: 250,
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: (){

              },
              child:Card(
                elevation: 10,
                shadowColor: Colors.white70,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Upload From Gallery ",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed:(){},
              child:Card(
                margin: EdgeInsets.only(top:20),
                elevation: 10,
                shadowColor: Colors.white70,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Upload From Camera ",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 20,
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
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => _MyPageState();
// }
// class _MyPageState extends State<MyPage> {
//   /// Variables
//   File imageFile;
//
//   /// Widget
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Image Picker"),
//         ),
//         body: Container(
//             child: imageFile == null
//                 ? Container(
//               alignment: Alignment.center,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   MaterialButton(
//                     color: Colors.greenAccent,
//                     onPressed: () {
//                       _getFromGallery();
//                     },
//                     child: Text("PICK FROM GALLERY"),
//                   ),
//                   Container(
//                     height: 40.0,
//                   ),
//                   MaterialButton(
//                     color: Colors.lightGreenAccent,
//                     onPressed: () {
//                       _getFromCamera();
//                     },
//                     child: Text("PICK FROM CAMERA"),
//                   )
//                 ],
//               ),
//             ): Container(
//               child: Image.file(
//                 imageFile,
//                 fit: BoxFit.cover,
//               ),
//             )));
//   }
//
//   /// Get from gallery
//   _getFromGallery() async {
//     PickedFile pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }
//
//   /// Get from Camera
//   _getFromCamera() async {
//     PickedFile pickedFile = await ImagePicker().getImage(
//       source: ImageSource.camera,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }
// }
