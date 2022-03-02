import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news/data/datanews.dart';
import 'package:news/data/news.dart';

class DataService {
  var category;
  var country;

  Future<List<dynamic>?> getData(country, category) async {
    final String url =
        'https://newsapi.org/v2/top-headlines?country=$country&apiKey=517a0c069b1242bdb87d5b54ac7252a3&1=page&category=$category';
    try {
      final response = await http.Client().get(Uri.parse(url));
      if (response.statusCode == 200) {
        final dataNews = DataNews.fromJson(jsonDecode(response.body));

        List<Articles>? listNews = dataNews.articles;
        return listNews;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
