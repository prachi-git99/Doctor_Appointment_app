import 'package:flutter/material.dart';
import 'package:doctor_g/utils/Routes.dart';
import 'package:get/get.dart';
import 'package:doctor_g/controllers/categoryController.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final CategoryController categoryController = Get.put(CategoryController());
  @override

  Widget build(BuildContext context) {
    return Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              child: ListView.builder(
              itemCount: categoryController.categoryList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder:  (context, index) {
                return GestureDetector(
                  onTap: () {
                  },
                  child: demoCategories(
                      categoryController.categoryList[index].image,
                      categoryController.categoryList[index].name),
                );
              },
              ),

            ),

    );
  }
}

Widget demoCategories(String image,String name){
  return Container(
    width: 100,
    margin: EdgeInsets.only(right: 15),
    decoration: BoxDecoration(
      color: Colors.blue[200],
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
          margin: EdgeInsets.only(top:10,left: 5,right: 5),
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

