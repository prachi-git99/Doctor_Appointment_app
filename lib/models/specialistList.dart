import 'package:cloud_firestore/cloud_firestore.dart';

class Specialists {
  String name;
  String image;
  String speciality;
  String rating;

  Specialists({
    required this.name,
    required this.image,
    required this.speciality,
    required this.rating,

  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "image":image,
    "speciality":speciality,
    "rating":rating,

    //"about":about,
  };

  static Specialists fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Specialists(
      name: snapshot['name'],
      image: snapshot['image'],
      speciality: snapshot['speciality'],
      rating: snapshot['rating'],
      //about: snapshot['about'],
    );
  }
}
