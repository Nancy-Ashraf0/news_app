import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app0/domain/entities/article_entity.dart';

class ArticleWidget extends StatelessWidget {
  ArticleEntity articleEntity;

  ArticleWidget({super.key, required this.articleEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: articleEntity.urlToImage ??
                "https://tse4.mm.bing.net/th?id=OIP.dxbZXa8oCXSWNkdn5Xu_pQHaEK&pid=Api&P=0&h=220",
            placeholder: (context, url) {
              return const CircularProgressIndicator();
            },
            errorWidget: (context, url, error) {
              return Center(child: Image.asset("assets/images/pattern.png"));
            },
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            articleEntity.sourceEntity!.name!,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            articleEntity.title ?? "",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            articleEntity.publishedAt!,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
          )
        ],
      ),
    );
  }
}
