import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news/data/datanews.dart';
import 'package:news/data/news.dart';

class DataService {
  var category;
  var country;

  Future<List<dynamic>> getData(country, category) async {
    final String url =
        'https://newsapi.org/v2/top-headlines?country=$country&apiKey=517a0c069b1242bdb87d5b54ac7252a3&1=page&category=$category';
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final dataNews = DataNews.fromJson(json);
        final map = dataNews.toJson();
        final list = map['articles'];

        var listNews = list.map((e) => News.formJason(e)).toList();
        return listNews;
      }
    } catch (e) {
      return [];
    }
  }
}
