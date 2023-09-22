import 'package:flutter/material.dart';
import 'package:ng_news/views/topic_toggle.dart';
import 'package:ng_news/constants.dart';
import '../views/articles_topics.dart';
import '../views/topic_toggle.dart';

class TransitionTabView extends StatefulWidget {
  const TransitionTabView({super.key});

  @override
  State<TransitionTabView> createState() => _TransitionTabViewState();
}

class _TransitionTabViewState extends State<TransitionTabView> {
  List<String> categories = [
    "samsung",
    "xiaomi",
    "apple",
    "microsoft",
    "huawei",
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('Actualité Tech'),
                pinned: true,
                floating: true,
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(child: Text(categories[0].toUpperCase())),
                    Tab(child: Text(categories[1].toUpperCase())),
                    Tab(child: Text(categories[2].toUpperCase())),
                    Tab(child: Text(categories[3].toUpperCase())),
                    Tab(child: Text(categories[4].toUpperCase())),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(children: [
            const SamsungTopic(),
            ArticleTopic(
                query: categories[1],
                fromDate: DateTime.parse(beginDate),
                toDate: DateTime.parse(endDate)),
            ArticleTopic(
                query: categories[2],
                fromDate: DateTime.parse(beginDate),
                toDate: DateTime.parse(endDate)),
            ArticleTopic(
                query: categories[3],
                fromDate: DateTime.parse(beginDate),
                toDate: DateTime.parse(endDate)),
            ArticleTopic(
                query: categories[4],
                fromDate: DateTime.parse(beginDate),
                toDate: DateTime.parse(endDate))
          ]),
        ),
      ),
    );
  }
}

