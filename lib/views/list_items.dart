import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ng_news/theme/style.dart';
import 'package:ng_news/theme/ui_helpers.dart';
import 'package:ng_news/models/article.dart';

class ListItem extends StatelessWidget {
  final Article article;
  final Function onTap;
  const ListItem({super.key, required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            height: 120,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => onTap(article),
                    child: SizedBox(
                      height: 220,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: kPadding8,
                                        ),
                                        child: Text(article.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge),
                                      ),
                                      UIHelper.verticalSpace(3),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: kPadding8),
                                        child: Text(article.content,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      DateFormat('dd.MM.yyyy')
                                          .format(article.publishedAt),
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              height: 70.0,
                              width: 100.0,
                              color: Colors.black12,
                              child: article.urlToImage != null
                                  ? FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.network(article.urlToImage! ?? 'https://firebasestorage.googleapis.com/v0/b/village-noah-app.appspot.com/o/htn%2Fimage_nf.jpg?alt=media&token=39ab05cc-7ece-48f8-adae-eb49cc31407e'),
                                    )
                                  : const Icon(Icons.image_not_supported,
                                      color: Colors.black54, size: 50.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider()
              ],
            )));
  }
}
