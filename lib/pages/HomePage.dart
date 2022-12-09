import 'package:doctor_g/widgets/category.dart';
import 'package:flutter/material.dart';
import 'package:doctor_g/utils/Routes.dart';
import 'package:doctor_g/widgets/specialistListHome.dart';
import 'package:doctor_g/widgets/drawer.dart';
import 'package:get/get.dart';
import 'package:doctor_g/controllers/homePageController.dart';
import 'package:doctor_g/constant.dart';
import 'package:doctor_g/controllers/categoryController.dart';
import 'package:doctor_g/controllers/specialistListController.dart';

class HomePage extends StatefulWidget {
  final String uid;
  HomePage({Key? key,required this.uid,}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final HomePageController homePageController = Get.put(HomePageController());
  final CategoryController categoryController = Get.put(CategoryController());
  final SpecialistsController specialistsController = Get.put(SpecialistsController());

  @override
  void initState() {
    super.initState();
    homePageController.updateUserId(widget.uid);
    categoryController.update();
    specialistsController.update();
  }
  @override
  Widget build(BuildContext context)  {
        Size size = MediaQuery.of(context).size;
          return GetBuilder<HomePageController>(
            init: HomePageController(),
            builder: (controller) {
              return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Theme.of(context).primaryColor,
                    centerTitle: true,
                    title: Text('DoctorG',style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                      fontSize: 30,

                    ),),
                    actions: [
                        GestureDetector(
                            child: Container(
                            margin:new EdgeInsets.only(),
                            ),
                        ),
                        GestureDetector(
                          child:InkWell(
                            onTap: (){
                            Navigator.pushNamed(context, Routes.userProfileRoute);
                            },
                           // onTap: ()=>codepur().add(),
                          child: Container(
                            margin:new EdgeInsets.only(top:5,right:15),
                            child:Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          ),
                        ),
                    ],
              ),

              body: Container(
                  decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  ),
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      controller.user['name'],
                      style:TextStyle(
                      fontSize:16,
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      ),
                      ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 20),
                    child: Text(
                    "Welcome Back,",
                    style: TextStyle(
                    color: Color(0xff363636),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 20, right: 20),
                    width: size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                        color: Color(0x14000000),
                        offset: Offset(0, 10),
                        blurRadius: 15,
                        spreadRadius: 0,
                        ),
                      ],
                    ),
                  child: Row(
                  children: [
                  Expanded(
                  flex: 5,
                  child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                  maxLines: 1,
                  autofocus: false,
                  style: TextStyle(color: Color(0xff107163), fontSize:16),
                  decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search..',
                  ),
                  cursorColor: Color(0xff107163),
                  ),
                  ),
                  ),
                  Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.searchRoute);
                    },
                    child: Container(
                    decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                    child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25,
                    ),
                    ),
                    ),
                  ),
                  ),
                  ],
                  ),
                  ),
                    // Container(
                    //   child:Image.network("https://img.freepik.com/premium-vector/online-doctor-with-computer_23-2148525681.jpg?w=2000"),
                    // ),
                  Container(
                  width:size.width ,
                  margin: EdgeInsets.only(top:20,left:20),
                  child: Stack(
                  fit: StackFit.loose,
                  children: [
                  Container(
                  child: Text(
                  "Category",
                  style: TextStyle(
                  color: Colors.black,
                  fontSize:18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  ),
                  ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.allCategoryRoute);
                    },
                    child: Container(
                    margin: EdgeInsets.only(right: 20, top: 1),
                    child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                    'See all',
                    style: TextStyle(
                    color: Color(0xff5e5d5d),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    ),
                    ),
                    ),
                    ),
                  )
                  ],
                  ),
                  ),
                  Container(
                    width: size.width,
                    height: 155,
                    child: Category(),
                  ),
                  Container(
                  width: size.width,
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Stack(
                  fit: StackFit.loose,
                  children: [
                  Container(
                  child: Text(
                  'Available Specialists',
                  style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  ),
                  ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.allSpecialistsRoute);
                    },
                    child: Container(
                    margin: EdgeInsets.only(right: 20, top: 1),
                    child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                    'See all',
                    style: TextStyle(
                    color: Color(0xff5e5d5d),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    ),
                    ),
                    ),
                    ),
                  )
                  ],
                  ),
                  ),
                  Container(
                    child: Specialists(),
                  ),
                  ],
                ),
              ),
              drawer: MyDrawer(uid:authController.user.uid),

              );
            }
          );
  }
}






// Widget demoCategories(String image,String name){
//   return Container(
//     width: 110,
//     margin: EdgeInsets.only(right: 15),
//     decoration: BoxDecoration(
//       color: Colors.blue[400],
//       borderRadius: BorderRadius.circular(2),
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           child: Image.network(image,width:50,height: 55,),
//         ),
//         Container(
//           margin: EdgeInsets.only(top: 20),
//           child: Text(
//             name,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 15,
//               fontFamily: 'Roboto',
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//
//       ],
//     ),
//   );
// }

