import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:doctor_g/utils/Routes.dart';
import 'package:get/get.dart';
import 'package:doctor_g/controllers/specialistListController.dart';

class Specialists extends StatefulWidget {
  const Specialists({Key? key}) : super(key: key);

  @override
  State<Specialists> createState() => _SpecialistsState();
}

class _SpecialistsState extends State<Specialists> {
  final SpecialistsController specialistsController = Get.put(SpecialistsController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ListView.builder(
          itemCount:2,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.doctorProfileRoute,);
              },
              child: Container(
                height: 110,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6.0,
                  )],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                            //margin: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width/3,
                            child: Image.network(specialistsController.specialists[index].image,height:120,),
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
                              specialistsController.specialists[index].name,
                              style: TextStyle(
                                color: Color(0xff363636),
                                fontSize:18,
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
                                  specialistsController.specialists[index].speciality,
                                  style: TextStyle(
                                    color:Colors.blue[700],
                                    fontFamily: 'Roboto',
                                    fontSize:15,
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
                                          specialistsController.specialists[index].rating,
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
          },
        ),
      ),
    );
  }
}
