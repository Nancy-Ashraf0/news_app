import 'package:hive_flutter/adapters.dart';
import 'package:news_app0/data/api/model/article.dart';
import 'package:news_app0/data/api/model/source.dart';

class LocalDataSource {
  Future<List<Source>?> getSources(String categoryId) async {
    var box = await Hive.openBox('sources_box');
    List<Source>? sources = box.get(categoryId);
    return sources;
  }

  Future<void> loadSources(List<Source> sources, String categoryId) async {
    var box = await Hive.openBox('sources_box');
    box.put(categoryId, sources);
  }
  Future<List<Article>?> getArticles(String sourceId) async {
    var box = await Hive.openBox('articles_box');
    List<Article>? articles = box.get(sourceId);
    return articles;
  }

  Future<void> loadArticles(List<Article> articles, String sourceId) async {
    var box = await Hive.openBox('articles_box');
    box.put(sourceId, articles);
  }
}
