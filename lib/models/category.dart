import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String name;
  String image;


  Category({
    required this.name,
    required this.image,

  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "image":image,
  };

  static Category fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Category(
      name: snapshot['name'],
      image: snapshot['image'],
    );
  }
}
