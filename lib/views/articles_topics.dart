import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ng_news/models/article.dart';
import 'package:ng_news/providers/provider.dart';
import 'package:ng_news/theme/ui_helpers.dart';
import 'package:ng_news/views/article_detail.dart';
import 'package:provider/provider.dart';

import 'list_items.dart';

class ArticleTopic extends StatefulWidget {
  final String query;
  final DateTime fromDate;
  final DateTime toDate;
  const ArticleTopic({
    super.key,
    required this.query,
    required this.fromDate,
    required this.toDate,
  });

  @override
  State<ArticleTopic> createState() => _ArticleTopicState();
}

class _ArticleTopicState extends State<ArticleTopic> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final articleProvider =
          Provider.of<ArticleProvider>(context, listen: false);
      articleProvider.fetchArticles(
          widget.query, widget.fromDate, widget.toDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ArticleProvider>(builder: (context, data, child) {
        final articles = data.articles;
        if (data.articles.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SafeArea(
              child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListItem(
                      article: articles[index],
                      onTap: (Article article) {
                        FocusManager.instance.primaryFocus!.unfocus();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleDetail(
                              article: article,
                              title: widget.query,
                            ),
                          ),
                        );
                      },
                    );
                  }
              )
            );
        }
      }),
  );
  }
}
