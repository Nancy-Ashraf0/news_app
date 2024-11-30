import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app0/data/api/model/article.dart';
import 'package:news_app0/data/api/model/source.dart';
import 'package:news_app0/data/repositories/news_repository/data_sources/local_data_source/news_Local_data.dart';

@Injectable(as: NewsLocalData)
class LocalDataSourceImpl extends NewsLocalData {
  @override
  Future<List<Source>?> getSources(String categoryId) async {
    var box = await Hive.openBox('sources_box');
    List<Source>? sources = box.get(categoryId);
    return sources;
  }

  @override
  Future<void> loadSources(List<Source> sources, String categoryId) async {
    var box = await Hive.openBox('sources_box');
    box.put(categoryId, sources);
  }

  @override
  Future<List<Article>?> getArticles(String sourceId) async {
    var box = await Hive.openBox('articles_box');
    List<Article>? articles = box.get(sourceId);
    return articles;
  }

  @override
  Future<void> loadArticles(List<Article> articles, String sourceId) async {
    var box = await Hive.openBox('articles_box');
    box.put(sourceId, articles);
  }
}
