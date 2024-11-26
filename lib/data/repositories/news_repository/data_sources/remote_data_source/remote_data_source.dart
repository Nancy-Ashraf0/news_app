import 'package:news_app0/data/api/api_manager.dart';
import 'package:news_app0/data/api/model/article.dart';
import '../../../../api/model/source.dart';

class RemoteDataSource {
  ApiManager apiManager;
  RemoteDataSource(this.apiManager);
  Future<List<Source>> getSources(String categoryId) async {
    return apiManager.getSources();
  }

  Future<List<Article>> getArticles(String sourceId ) async {
    return apiManager.getArticles(sourceId);
  }
}
