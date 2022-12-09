import 'dart:ffi';
import 'package:doctor_g/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_g/controllers/specialistListController.dart';

class AllSpecialists extends StatefulWidget {
  const AllSpecialists({Key? key}) : super(key: key);

  @override
  State<AllSpecialists> createState() => _AllSpecialistsState();
}

class _AllSpecialistsState extends State<AllSpecialists> {
  final SpecialistsController specialistsController = Get.put(SpecialistsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.blue,),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, Routes.doctorProfileRoute,);
        },
        child: Container(
          color: Colors.white30,
          padding:EdgeInsets.all(12.0),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount:specialistsController.specialists.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:1,
              mainAxisSpacing: 10.0,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height /6),
            ),
            itemBuilder: (BuildContext context, int index){
              return Container(
                   child: specialists(specialistsController.specialists[index].image,
                        specialistsController.specialists[index].name,
                          specialistsController.specialists[index].speciality,
                          specialistsController.specialists[index].rating),
                 );
            },
          ),
        ),
      ),
    );
  }
}

Widget specialists(image,name,speciality,rating)
{
  return Scaffold(
    body: Container(
      height:110,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(
          color: Colors.blue,
          blurRadius: 6.0,
        )],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              child: Image.network(image,height:110),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Color(0xff363636),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        speciality,
                        style: TextStyle(
                          color:Colors.blue[700],
                          fontFamily: 'Roboto',
                          fontSize:16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Rating: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                rating,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}