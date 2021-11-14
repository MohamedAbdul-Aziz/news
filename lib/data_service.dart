import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news/datanews.dart';
import 'package:news/news.dart';

class DataService {
  final String Url =
      'https://newsapi.org/v2/top-headlines?country=eg&apiKey=517a0c069b1242bdb87d5b54ac7252a3';
  Future<List<dynamic>> getData() async {
    try {
      var response = await http.get(Url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final dataNews = DataNews.fromJson(json);
        final map = dataNews.toJson();
        final list = map['articles'];

        final listNews = list.map((e) => News.formJason(e)).toList();
        return listNews;
      }
    } catch (e) {
      return [];
    }
  }
}
