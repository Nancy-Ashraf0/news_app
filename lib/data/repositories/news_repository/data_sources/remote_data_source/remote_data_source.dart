import '../../../../api/model/article.dart';
import '../../../../api/model/source.dart';

abstract class RemoteDataSource {
  Future<List<Article>> getArticles(String sourceId);

  Future<List<Source>> getSources(String categoryId);

  Future<List<Article>> getArticlesByQ(String sourceId, String q);
}