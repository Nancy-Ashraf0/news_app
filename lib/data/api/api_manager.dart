import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app0/data/api/model/article.dart';
import 'package:news_app0/data/api/model/article_response.dart';
import 'package:news_app0/data/api/model/source.dart';
import 'package:news_app0/data/api/model/sources_response.dart';

@injectable
class ApiManager {
  static const _apiKey = "5c18d836451d4c7d8cbff640067c09ea";
  static const _baseUrl = "newsapi.org";
  static const _sourcesEndPoint = "v2/top-headlines/sources";
  static const _articlesEndPoint = "v2/everything";
  static const message = "Something went wrong try again later...";

  Future<List<Source>> getSources(String categoryId) async {
    try {
      Uri url = Uri.https(_baseUrl, _sourcesEndPoint,
          {"apiKey": _apiKey, "category": categoryId});
      Response serverResponse = await get(url);
      SourcesResponse sourcesResponse =
          SourcesResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
        return sourcesResponse.sources!;
      } else {
        throw sourcesResponse.message ?? message;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Article>> getArticles(String sourceId) async {
    try {
      Uri url = Uri.https(_baseUrl, _articlesEndPoint,
          {"apiKey": _apiKey, "sources": sourceId});
      Response serverResponse = await get(url);
      ArticleResponse articleResponse =
          ArticleResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
        return articleResponse.articles!;
      } else {
        throw articleResponse.message ?? message;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Article>> getArticlesByQ(String sourceId, String q) async {
    try {
      Uri url = Uri.https(_baseUrl, _articlesEndPoint,
          {"apiKey": _apiKey, "sources": sourceId, "q": q});
      Response serverResponse = await get(url);
      ArticleResponse articleResponse =
          ArticleResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
        return articleResponse.articles!;
      } else {
        throw articleResponse.message ?? message;
      }
    } catch (e) {
      rethrow;
    }
  }
}
