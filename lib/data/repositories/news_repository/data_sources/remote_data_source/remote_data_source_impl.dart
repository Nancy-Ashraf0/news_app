import 'package:injectable/injectable.dart';
import 'package:news_app0/data/api/api_manager.dart';
import 'package:news_app0/data/api/model/article.dart';
import 'package:news_app0/data/repositories/news_repository/data_sources/remote_data_source/remote_data_source.dart';

import '../../../../api/model/source.dart';

@Injectable(as: RemoteDataSource)
class RemoteDataSourceImpl extends RemoteDataSource {
  ApiManager apiManager;

  RemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<Source>> getSources(String categoryId) async {
    return apiManager.getSources(categoryId);
  }

  @override
  Future<List<Article>> getArticles(String sourceId) async {
    return apiManager.getArticles(sourceId);
  }

  @override
  Future<List<Article>> getArticlesByQ(String sourceId, String q) {
    return apiManager.getArticlesByQ(sourceId, q);
  }
}
