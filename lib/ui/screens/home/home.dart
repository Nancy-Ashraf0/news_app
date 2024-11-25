import 'package:flutter/material.dart';
import 'package:news_app0/ui/screens/home/tabs/categories/categories.dart';
import 'package:news_app0/ui/screens/home/tabs/settings/settings.dart';
import 'package:news_app0/utils/widgets/drawer_widget.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";

   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex=0;
  List<Widget> tabs=[const CategoriesScreen(),const SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(onTab: (index){
        currentIndex=index;
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
        child: const Text(
          "News App",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
