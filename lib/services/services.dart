import 'package:ng_news/models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config.dart';

class Service {
  Future<List<Article>> fetchData(
      String query, DateTime fromDate, DateTime toDate) async {
    final url = Uri.parse(
        "$baseUrl?q=${query} &from=${fromDate.toIso8601String()}&to=${toDate.toIso8601String()}&pageSize=80&sortBy=popularity&language=fr&apiKey=$apiKey");

    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        // Traitement des données de réponse ici
        final jsonData = jsonDecode(response.body)['articles'] as List;
        final data = jsonData.map((article) {
          return Article.fromJson(article);
        }).toList();
        return data;
      } else {
        // Gestion des erreurs ici
        print(
            'Erreur lors de la récupération des données: ${response.statusCode}');
        throw Exception("Une erreur s'est produite");
      }
    } catch (e) {
      // 4. return Failure here too
      throw Exception("Une erreur $e s'est produite");
    }
  }
}
