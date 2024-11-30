import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app0/ui/screens/article_details_screen/articles_details_Screen.dart';
import 'package:news_app0/ui/screens/home/home.dart';
import 'package:news_app0/ui/screens/news/news_page.dart';
import 'package:news_app0/ui/screens/splash/splash.dart';

import 'data/api/model/article.dart';
import 'data/api/model/source.dart';
import 'domain/di/di.dart';

void main() async {
  configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(SourceAdapter());
  Hive.registerAdapter(ArticleAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        Home.routeName: (_) => Home(),
        Splash.routeName: (_) => Splash(),
        NewsPage.routeName: (_) => const NewsPage(),
        ArticleDetailsScreen.routeName: (_) => ArticleDetailsScreen()
      },
      initialRoute: Splash.routeName,
    );
  }
}
