import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorProfile {
  //final String imagePath;
  final String name;
  final String speciality;
  final String clinicName;
  final String degree;
  final String about;
  //final String image;


  const DoctorProfile({
    //required this.imagePath,
    required this.name,
    required this.speciality,
    required this.clinicName,
    required this.degree,
    required this.about,
  });

  Map<String, dynamic> toJson() => {
    "name":name,
    "speciality":speciality,
    "clinicName":clinicName,
    'degree':degree,
    'about':about,
  };

  static DoctorProfile fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return DoctorProfile(
      name: snapshot['name'],
      clinicName: snapshot['clinicName'],
      speciality: snapshot['speciality'],
      degree: snapshot['degree'],
      about: snapshot['about'],
    );
  }


}
