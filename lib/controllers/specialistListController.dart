import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_g/constant.dart';
import 'package:doctor_g/models/doctorProfile.dart';
import 'package:doctor_g/models/specialistList.dart';
import 'package:doctor_g/controllers/categoryController.dart';
import 'package:get/get.dart';

class SpecialistsController extends GetxController{
  final Rx<List<Specialists>> _specialists = Rx<List<Specialists>>([]);

  final Rx<List<DoctorProfile>> _doctorProfile = Rx<List<DoctorProfile>>([]);

  List<Specialists> get specialists => _specialists.value;
  List<DoctorProfile> get doctorProfile => _doctorProfile.value;

  @override
  void onInit() {
    super.onInit();
    _specialists.bindStream(firestore.collection('Specialists').snapshots().map((QuerySnapshot query){
      List<Specialists> retVal = [];
      for(var element in query.docs){
        retVal.add(Specialists.fromSnap(element));
      }
      return retVal;
    }));

    // _doctorProfile.bindStream(firestore.collection('Specialists').snapshots().map((QuerySnapshot query){
    //   List<DoctorProfile> Value = [];
    //   for(var ele in query.docs){
    //     Value.add(DoctorProfile.fromSnap(ele));
    //   }
    //   return Value;
    // }));

  }

}