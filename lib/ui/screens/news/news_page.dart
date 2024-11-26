import 'package:flutter/material.dart';
import 'package:news_app0/data/api/api_manager.dart';
import 'package:news_app0/data/api/model/source.dart';
import 'package:news_app0/ui/screens/news/article_widget.dart';
import 'package:news_app0/ui/widgets/error_widget.dart';
import 'package:news_app0/ui/widgets/loading_widget.dart';

class NewsPage extends StatefulWidget {
  static const String routeName = "news";

  NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<int> test = [1, 2, 3];
  List<ArticleWidget> articles=[ArticleWidget(),ArticleWidget()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [Expanded( flex: 2, child: buildTabList(test)),
        Expanded(flex: 8, child:  ListView.builder(itemCount: articles.length,
            itemBuilder:(context,index)=> ArticleWidget()))],
      ),
    );
  }

  Widget buildTabList(List<int> sources) {
    List<Widget> tabs =
        [Text("0"), Text("llllll"), Text("121212")].map((test) {
      return buildTab(true);
    }).toList();
    // List<Widget> tabBarViews = [Text("0"), Text("llllll"), Text("121212")];

    return DefaultTabController(
      length: sources.length,
      child: Column(children: [
        TabBar(
          tabs: tabs,
          isScrollable: true,
        ),
        // Expanded(child: TabBarView(children: tabBarViews))
      ]),
    );
  }

  Widget buildTab(bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 30),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.green,
          )),
      child: Text(
        "blablabla",
        style: TextStyle(color: isSelected ? Colors.white : Colors.green),
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
/*
* FutureBuilder(
          future: ApiManager.getSources(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return MyError(
                errorMessage: snapshot.error.toString(),
                onRetry: () {},
              );
            } else if (snapshot.hasData) {
              return BuildTabList(snapshot.data!);
            } else {
              return LoadingWidget();
            }
          })*/
/*
* BuildTabList(List<Source> sources) {
    List<Widget> tabs = sources.map((source) {
      return buildTab(source, true);
    }).toList();
    List<Widget> tabBarViews = sources.map((source) {
      return Text(source.name ?? "");
    }).toList();
    return DefaultTabController(
      length: sources.length,
      child: Column(children: [
        TabBar(
          tabs: tabs,
          isScrollable: true,
        ),
        Expanded(child: TabBarView(children: tabBarViews))
      ]),
    );
  }*/
