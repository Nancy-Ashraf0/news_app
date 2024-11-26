import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl:
              "https://tse4.mm.bing.net/th?id=OIP.dxbZXa8oCXSWNkdn5Xu_pQHaEK&pid=Api&P=0&h=220",
          placeholder: (context, url) {
            return const CircularProgressIndicator();
          },
          errorWidget: (context, url, error) {
            return const Icon(
              Icons.error_outline,
              color: Colors.red,
            );
          },
        ),
        const Text(textAlign: TextAlign.start,
          "Source Name",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
        ),
        const Text(
          "Source title",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const Text(
          "Source time",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
        )
      ],
    );
  }
}
