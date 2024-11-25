import 'package:flutter/material.dart';

class CategoryModel {
  String categoryId;
  String imagePath;
  String title;
  bool isLeft;
  Color backgroundColor;
  CategoryModel(
      {required this.title,
      required this.imagePath,
      required this.categoryId,
      required this.isLeft,
      required this.backgroundColor});
  static List<CategoryModel> categories=[
    CategoryModel(title: "Sports", imagePath: "assets/images/ball.png",
        categoryId: "sports", isLeft: true, backgroundColor: const Color(0xffC91C22)),
    CategoryModel(title: "Technology", imagePath: "assets/images/Politics.png",
        categoryId: "technology", isLeft: false, backgroundColor: const Color(0xff003E90)),
    CategoryModel(title: "Health", imagePath: "assets/images/health.png",
        categoryId: "health", isLeft: true, backgroundColor: const Color(0xffED1E79)),
    CategoryModel(title: "Business", imagePath: "assets/images/business.png",
        categoryId: "business", isLeft: false, backgroundColor: const Color(0xffCF7E48)),
    CategoryModel(title: "Environment", imagePath: "assets/images/environment.png",
        categoryId: "environment", isLeft: true, backgroundColor: const Color(0xff4882CF)),
    CategoryModel(title: "Science", imagePath: "assets/images/science.png",
        categoryId: "science", isLeft: false, backgroundColor: const Color(0xffF2D352)),
  ];
}
