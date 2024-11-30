import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app0/domain/entities/article_entity.dart';
import 'package:news_app0/ui/screens/news/article_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static const String routeName = "articleScreen";
  late ArticleEntity articleEntity;
  late final Uri _url;

  ArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    articleEntity = ModalRoute.of(context)!.settings.arguments as ArticleEntity;
    _url = Uri.parse(articleEntity.url ?? "");
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ArticleWidget(articleEntity: articleEntity),
            Expanded(
                child: SingleChildScrollView(
              child: Text(articleEntity.content ?? context.tr("randomContent")),
            )),
            InkWell(
              onTap: () {
                _launchUrl();
              },
              child: Row(
                children: [
                  Text(context.tr("viewFullArticle")),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      backgroundColor: Colors.green,
      title: Text(
        articleEntity.sourceEntity!.name ?? " News Title",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
