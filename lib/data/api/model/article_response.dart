import 'package:news_app0/data/api/model/base_response.dart';
import 'article.dart';

class ArticleResponse extends BaseResponse {
  num? totalResults;
  List<Article>? articles;

  ArticleResponse({
    this.totalResults,
    this.articles,
  });

  ArticleResponse.fromJson(dynamic json) : super.fromJson(json) {
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
