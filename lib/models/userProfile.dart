

class UserProfile {
  //final String imagePath;
  final String name;
  final String email;
  final String phone;
  final String age;
  final String gender;
  final String bloodGrp;


  const UserProfile({
    //required this.imagePath,
    required this.name,
    required this.email,
    required this.phone,
    required this.age,
    required this.gender,
    required this.bloodGrp,
  });

  Map<String, dynamic> toJson() => {
    "name":name,
    "email":email,
    "phone":phone,
    'age':age,
    'gender':gender,
    'bloodGrp':bloodGrp,
  };


}
