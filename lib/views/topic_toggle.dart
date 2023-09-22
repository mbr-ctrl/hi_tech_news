import 'package:flutter/material.dart';
import 'package:ng_news/providers/provider.dart';
import 'package:ng_news/theme/style.dart';
import 'package:ng_news/theme/ui_helpers.dart';
import 'package:ng_news/views/article_detail.dart';
import 'package:ng_news/views/articles_topics.dart';
import 'package:ng_news/constants.dart';
import 'package:provider/provider.dart';

class SamsungTopic extends StatefulWidget {
  const SamsungTopic({super.key});

  @override
  State<SamsungTopic> createState() => _SamsungTopicState();
}

class _SamsungTopicState extends State<SamsungTopic> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final articleProvider =
          Provider.of<ArticleProvider>(context, listen: false);
      articleProvider.fetchArticles('samsung', DateTime.parse(beginDate), DateTime.parse(endDate));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Consumer<ArticleProvider>(
          builder: (context, data, child) {
            final articles = data.articles;
            if (data.articles.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: 15),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 272,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: articles.take(10).toList().length,
                            itemBuilder: (context, index) {
                              final article = articles[index];
                              return GestureDetector(
                                onTap: (() => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ArticleDetail(
                                          article: article,
                                          title: 'samsung',
                                        ),
                                      ),
                                    )),
                                child: Container(
                                  height: 272,
                                  width: 222,
                                  margin: EdgeInsets.only(
                                    left: kPadding20,
                                    right: index ==
                                            articles.take(10).toList().length - 1
                                        ? kPadding20
                                        : 0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      kBorderRadius20,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 0,
                                        offset: const Offset(0, 18),
                                        blurRadius: 18,
                                        color: kBlack.withOpacity(0.1),
                                      )
                                    ],
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        article.urlToImage ?? 'https://firebasestorage.googleapis.com/v0/b/village-noah-app.appspot.com/o/htn%2Fimage_nf.jpg?alt=media&token=39ab05cc-7ece-48f8-adae-eb49cc31407e',
                                      ),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 136,
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft:
                                                  Radius.circular(kBorderRadius20),
                                              bottomRight:
                                                  Radius.circular(kBorderRadius20),
                                            ),
                                            gradient: kLinearGradientBlack,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: kPadding16,
                                            vertical: kPadding20,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                          kBorderRadius20,
                                                        ),
                                                        color: kBlack.withOpacity(
                                                          0.24,
                                                        ),
                                                      ),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: kPadding8,
                                                        vertical: kPadding4,
                                                      ),
                                                      child: Text(
                                                        article.publishedAt
                                                            .toString(),
                                                        style: kRalewayRegular
                                                            .copyWith(
                                                          color: kWhite,
                                                          fontSize: SizeConfig
                                                                  .blockSizeHorizontal! *
                                                              2.5,
                                                        ),
                                                      ))
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    article.title,
                                                    style: kRalewayMedium.copyWith(
                                                      color: kWhite,
                                                      fontSize: SizeConfig
                                                              .blockSizeHorizontal! *
                                                          4,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: SizeConfig
                                                            .blockSizeVertical! *
                                                        0.5,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: kPadding8,
                        ),
                        Expanded(
                          child: ArticleTopic(query: 'samsung', fromDate: DateTime.parse(beginDate), toDate: DateTime.parse(endDate))
                          )
                      ],
                    ),
                  ),
            );
            }
          },
        ),
    );
  }
}
