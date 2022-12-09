import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_g/controllers/specialistListController.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class DoctorProfile extends StatefulWidget {


  const DoctorProfile({Key? key}) : super(key: key);

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  final SpecialistsController specialistsController = Get.put(SpecialistsController());
  final number='7300802027';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: BackButton(color: Colors.blue,),
      ),

      bottomSheet:GestureDetector(
        onTap: (){
          //Navigator.pushNamed(context, Routes.imageUploadRoute);
        },
        child:  Container(
          height: 70,
          width: double.infinity,
          child: Container(
            color: Colors.blue[200],
            child:Center(
              child: Text("Book Appointment",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
        ),
      ),
      body:Container(
        child: Column(
          children: [
            Container(
              child:  CircleAvatar(
                backgroundColor: Colors.blue[900],
                radius:82,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius:80,
                  backgroundImage: NetworkImage(specialistsController.specialists[0].image),
                ),
              ),
            ),
            SizedBox(height:15),
            Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width:10),
                        Expanded(
                          child:TextButton.icon(
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(color: Colors.blue[200]),
                              backgroundColor: Colors.blue[200],
                            ),
                            onPressed: () => {},
                            icon: Icon(Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                            label: Text('Video call',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:16
                                  ,fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:10),
                      ],
                    ),
                    Row(
                        children: [
                          SizedBox(width:10),
                          Expanded(
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(color: Colors.blue[200]),
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () => {
                                 FlutterPhoneDirectCaller.callNumber(number)
                              },
                              icon: Icon(Icons.call,
                                color: Colors.white,
                              ),
                              label: Text('Voice call',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width:5),
                          Expanded(
                              child:TextButton.icon(
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(color: Colors.blue[600]),
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () => {
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Chat(user:user))),
                                },
                                icon: Icon(Icons.message_sharp,
                                  color: Colors.white,
                                ),
                                label: Text('Message',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ),
                                ),
                              ),
                          ),
                          SizedBox(width:10),
                        ],
                    ),
                  ],
                ),
              ),


            Column(
                children: [
                  SizedBox(height:7),
                  Text(specialistsController.specialists[0].name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize:20,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height:5),
                  Text(specialistsController.specialists[0].speciality,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize:16,
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height:5),
                  Text("Ambey Homeopathy Clinic",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize:18,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height:5),
                  Text("B.H.M.S , M.D",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize:16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:5),
                Text("About Doctor :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height:7),
                Text("Dr.Prachi verma, have completed a 9 yr medical practice . She is a very good doctor. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
