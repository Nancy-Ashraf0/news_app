import 'package:flutter/material.dart';
import 'package:news_app0/ui/models/category_model.dart';

class AppCategory extends StatelessWidget {
  CategoryModel categoryModel;
  AppCategory({super.key, required this.categoryModel});
  final radius = Radius.circular(24);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: categoryModel.backgroundColor,
          borderRadius: BorderRadius.only(
              topRight: radius,
              topLeft: radius,
              bottomLeft: categoryModel.isLeft ? radius : Radius.zero,
              bottomRight: categoryModel.isLeft ? Radius.zero : radius)),
      child: Column(
        children: [
          Image.asset(
            categoryModel.imagePath,
            height: MediaQuery.of(context).size.height * .15,
          ),
          Text(
            categoryModel.title,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),
          )
        ],
      ),
    );
  }
}
