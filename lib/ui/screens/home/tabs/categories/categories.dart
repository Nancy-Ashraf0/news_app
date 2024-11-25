import 'package:flutter/material.dart';
import 'package:news_app0/ui/models/category_model.dart';
import 'package:news_app0/ui/screens/home/tabs/categories/app_category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
            child: Row(
          children: [
            SizedBox(
              width: 26,
            ),
            Text(
              "Pick your Category\n of interist",
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
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return AppCategory(
                  categoryModel: CategoryModel.categories[index]);
            },
            itemCount: CategoryModel.categories.length,
          ),
        )
      ],
    );
  }
}
