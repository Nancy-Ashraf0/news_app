import 'package:news_app0/domain/entities/source_entity.dart';

class ArticleEntity {
  SourceEntity? sourceEntity;
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  ArticleEntity(
      {required this.sourceEntity,
      required this.author,
      required this.title,
      required this.content,
      required this.description,
      required this.publishedAt,required this.url,required this.urlToImage});
}
