import 'package:flutter/material.dart';
import 'package:ng_news/models/article.dart';
import 'package:intl/intl.dart';

import '../theme/style.dart';
import '../theme/ui_helpers.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;
  final String title;
  const ArticleDetail({super.key, required this.article, required this.title});

  @override
  Widget build(BuildContext context) {
    final String content =
        article.content.substring(0, article.content.indexOf("[+")) +
            article.content.substring(article.content.indexOf("]") + 1);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: paddingMainView,
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  DateFormat('dd.MM.yyyy').format(article.publishedAt),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                UIHelper.verticalSpaceSmall(),
                Visibility(
                  visible: article.urlToImage != null,
                  child: Image.network(article.urlToImage ?? ''),
                ),
                UIHelper.verticalSpaceSmall(),
                Text(
                    content,
                  style: const TextStyle(
                    fontSize: 16
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
