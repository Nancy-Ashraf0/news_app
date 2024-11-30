import 'package:easy_localization/easy_localization.dart';
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

  static List<CategoryModel> categories = [
    CategoryModel(
        title: tr("sports"),
        imagePath: "assets/images/ball.png",
        categoryId: "sports",
        isLeft: true,
        backgroundColor: const Color(0xffC91C22)),
    CategoryModel(
        title: tr("technology"),
        imagePath: "assets/images/Politics.png",
        categoryId: "technology",
        isLeft: false,
        backgroundColor: const Color(0xff003E90)),
    CategoryModel(
        title: tr("health"),
        imagePath: "assets/images/health.png",
        categoryId: "health",
        isLeft: true,
        backgroundColor: const Color(0xffED1E79)),
    CategoryModel(
        title: tr("business"),
        imagePath: "assets/images/business.png",
        categoryId: "business",
        isLeft: false,
        backgroundColor: const Color(0xffCF7E48)),
    CategoryModel(
        title: tr("entertainment"),
        imagePath: "assets/images/environment.png",
        categoryId: "entertainment",
        isLeft: true,
        backgroundColor: const Color(0xff4882CF)),
    CategoryModel(
        title: tr("science"),
        imagePath: "assets/images/science.png",
        categoryId: "science",
        isLeft: false,
        backgroundColor: const Color(0xffF2D352)),
  ];
}
