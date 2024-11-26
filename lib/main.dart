import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app0/ui/screens/home/home.dart';
import 'package:news_app0/ui/screens/news/news_page.dart';
import 'package:news_app0/ui/screens/splash/splash.dart';

import 'data/api/model/source.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SourceAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.routeName: (_) => Home(),
        Splash.routeName: (_) => Splash(),
        NewsPage.routeName: (_) => NewsPage()
      },
      initialRoute: NewsPage.routeName,
    );
  }
}
