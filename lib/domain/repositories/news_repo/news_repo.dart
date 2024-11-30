import '../../entities/article_entity.dart';
import '../../entities/source_entity.dart';

abstract class NewsRepository {
  Future<List<SourceEntity>> getSources(String categoryId);

  Future<List<ArticleEntity>> getArticles(String sourceId);

  Future<List<ArticleEntity>> getArticlesByQ(String sourceId, String q);
}
