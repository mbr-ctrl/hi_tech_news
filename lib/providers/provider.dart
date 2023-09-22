import 'package:ng_news/services/services.dart';
import 'package:ng_news/models/article.dart';
import 'package:flutter/foundation.dart';

class ArticleProvider extends ChangeNotifier {
  final _service = Service();
  bool isLoading = false;
  List<Article> _articles = [];
  List<Article> get articles => _articles;

  Future<void> fetchArticles(
      String query, DateTime fromDate, DateTime toDate) async {
    isLoading = true;
    notifyListeners();

    final response = await _service.fetchData(query, fromDate, toDate);
    _articles = response;
    isLoading = false;
    notifyListeners();
  }
}
