import 'package:flutter/material.dart';
import 'package:doctor_g/utils/Routes.dart';

class CategoryDoctor extends StatefulWidget {
  const CategoryDoctor({Key? key}) : super(key: key);

  @override
  _CategoryDoctorState createState() => _CategoryDoctorState();
}

class _CategoryDoctorState extends State<CategoryDoctor> {
  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
          backgroundColor: Colors.blue[700],
          centerTitle: true,
          title: Text(
            'DERMATOLOGISTS',
            style: TextStyle(
              letterSpacing: 2,
              fontSize:20,
              fontFamily: 'Roboto',
            ),
      )),
      body:
      Container(
        margin: EdgeInsets.only(top:10,right:5,left:5),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              height: 130,
                child:Card(
                  shadowColor: Colors.grey,
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.doctorProfileRoute);
                    },
                    leading: Image.network("https://cdn-icons-png.flaticon.com/512/607/607414.png"),
                    title: Text("Dr.Prachi Verma\n",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("Dermatologist\n30 saal",
                      style: TextStyle(
                        fontSize: 15,

                      ),
                    ),
                    trailing: Text(
                      "4.5",
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
            );
          },
        ),
      ),


    );
  }
}
//
// Widget Doctors(String image, String name, String speciality, String rating,String experience){
//   // return Container(
//   //   height: 150,
//   //   color: Colors.white,
//   //
//   // );
//   return  Container(
//     margin: EdgeInsets.only(top:10),
//     height: 160,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(5),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: EdgeInsets.only(left:10),
//           child: Image.network(image),
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top:20),
//                 child: Text(
//                   name,
//                   style:TextStyle(
//                     color: Color(0xff363636),
//                     fontSize: 20,
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       speciality,
//                       style: TextStyle(
//                         color:Colors.teal,
//                         fontFamily: 'Roboto',
//                         fontSize:16,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: 3),
//                       child: Row(
//                         children: [
//                           Container(
//                             child: Text(
//                               "Rating: ",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 12,
//                                 fontFamily: 'Roboto',
//                               ),
//                             ),
//                           ),
//                           Container(
//                             child: Text(
//                               rating,
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 12,
//                                 fontFamily: 'Roboto',
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top:10),
//                       child:Text(
//                         experience,
//                         style: TextStyle(
//                           color:Colors.teal,
//                           fontFamily: 'Roboto',
//                           fontSize:16,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }