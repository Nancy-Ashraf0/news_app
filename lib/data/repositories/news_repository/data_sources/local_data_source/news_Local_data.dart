import '../../../../api/model/article.dart';
import '../../../../api/model/source.dart';

abstract class NewsLocalData {
  Future<List<Source>?> getSources(String categoryId);

  Future<void> loadSources(List<Source> sources, String categoryId);

  Future<List<Article>?> getArticles(String sourceId);

  Future<void> loadArticles(List<Article> articles, String sourceId);
}