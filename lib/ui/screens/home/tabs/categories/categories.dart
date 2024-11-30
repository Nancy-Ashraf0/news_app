import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app0/ui/models/category_model.dart';
import 'package:news_app0/ui/screens/home/tabs/categories/app_category.dart';

class CategoriesScreen extends StatelessWidget {
  Function onCategoryClick;

  CategoriesScreen({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Row(
          children: [
            SizedBox(
              width: 26,
            ),
            Text(
              context.tr("pickCategory"),
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Color(0xff4F5A69)),
            ),
          ],
        )),
        Expanded(
          flex: 9,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InkWell(
                child:
                    AppCategory(categoryModel: CategoryModel.categories[index]),
                onTap: () {
                  onCategoryClick(CategoryModel.categories[index]);
                },
              );
            },
            itemCount: CategoryModel.categories.length,
          ),
        )
      ],
    );
  }
}
