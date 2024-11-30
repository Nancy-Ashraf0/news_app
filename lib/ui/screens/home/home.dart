import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app0/ui/models/category_model.dart';
import 'package:news_app0/ui/screens/home/tabs/categories/categories.dart';
import 'package:news_app0/ui/screens/home/tabs/settings/settings.dart';
import 'package:news_app0/ui/screens/news/news_page.dart';
import 'package:news_app0/utils/widgets/drawer_widget.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  int? index;
  late List<Widget> tabs;

  @override
  void initState() {
    super.initState();
    tabs = [
      CategoriesScreen(
        onCategoryClick: onCategoryClick,
      ),
      const SettingsScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    try {
      index = ModalRoute.of(context)!.settings.arguments as int;
      currentIndex = index!;
    } catch (e) {}
    return Scaffold(
      drawer: DrawerWidget(onTab: (index) {
        currentIndex = index;
        setState(() {});
        Navigator.pop(context);
      }),
      appBar: buildAppBar(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"))),
        child: tabs[currentIndex],
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      backgroundColor: Colors.green,
      title: Container(
        margin: const EdgeInsets.only(left: 80),
        child: Text(
          currentIndex == 0 ? context.tr("appName") : context.tr("settings"),
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  onCategoryClick(CategoryModel category) {
    Navigator.pushNamed(context, NewsPage.routeName,
        arguments: category.categoryId);
  }
}
