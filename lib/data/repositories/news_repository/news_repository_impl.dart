import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app0/data/api/model/article.dart';
import 'package:news_app0/data/api/model/source.dart';
import 'package:news_app0/domain/entities/article_entity.dart';
import 'package:news_app0/domain/entities/source_entity.dart';

import '../../../domain/repositories/news_repo/news_repo.dart';
import 'data_sources/local_data_source/news_Local_data.dart';
import 'data_sources/remote_data_source/remote_data_source.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository {
  RemoteDataSource remoteDataSource;
  NewsLocalData localDataSource;

  NewsRepositoryImpl(this.localDataSource, this.remoteDataSource);

  @override
  Future<List<SourceEntity>> getSources(String categoryId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      List<Source> sources = await remoteDataSource.getSources(categoryId);
      localDataSource.loadSources(sources, categoryId);
      return sources.map((source) {
        return source.toEntity();
      }).toList();
    } else {
      List<Source>? sources = await localDataSource.getSources(categoryId);
      if (sources == null) {
        throw "Please check your internet connection";
      } else {
        return sources.map((source) {
          return source.toEntity();
        }).toList();
      }
    }
  }

  Future<List<ArticleEntity>> getArticles(String sourceId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      List<Article>? articles = await remoteDataSource.getArticles(sourceId);
      localDataSource.loadArticles(articles, sourceId);
      return articles.map((article) {
        return article.toEntity();
      }).toList();
    } else {
      List<Article>? articles = await localDataSource.getArticles(sourceId);
      if (articles == null) {
        throw "Please check your internet connection";
      } else {
        return articles.map((article) {
          return article.toEntity();
        }).toList();
      }
    }
  }

  @override
  Future<List<ArticleEntity>> getArticlesByQ(String sourceId, String q) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      List<Article>? articles =
          await remoteDataSource.getArticlesByQ(sourceId, q);
      localDataSource.loadArticles(articles, sourceId);
      return articles.map((article) {
        return article.toEntity();
      }).toList();
    } else {
      List<Article>? articles = await localDataSource.getArticles(sourceId);
      if (articles == null) {
        throw "Please check your internet connection";
      } else {
        return articles.map((article) {
          return article.toEntity();
        }).toList();
      }
    }
  }
}
