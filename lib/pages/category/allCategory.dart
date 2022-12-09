import 'package:flutter/material.dart';
import 'package:doctor_g/widgets/category.dart';
import 'package:get/get.dart';
import 'package:doctor_g/controllers/categoryController.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  final CategoryController categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: BackButton(
          color: Colors.blue,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding:EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount:categoryController.categoryList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 16.0,
          ),
          itemBuilder: (BuildContext context, int index){

            return Container(
                child: categories(categoryController.categoryList[index].image,categoryController.categoryList[index].name));
          },
        ),

      ),
    );
  }
}

Widget categories(String image,String name){
  return Container(
    margin: EdgeInsets.only(right:15),
    decoration: BoxDecoration(
      color: Colors.blue[400],
      borderRadius: BorderRadius.circular(12),
      boxShadow: [BoxShadow(
        color: Colors.black54,
        blurRadius: 7.0,
      )],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Image.network(image,height:70,width:80,),
        ),
        Container(
          margin: EdgeInsets.only(top:10,left:5,right: 5),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),

      ],
    ),
  );
}