import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class NewsService {
  static const all_news_service =
      'https://newsapi.org/v2/everything?q=*&apiKey=e3e60678670c47f1aa1249f34601b33a';
  static const breaking_news_service =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=e3e60678670c47f1aa1249f34601b33a';

  Future<List<NewsModel>> getEverything() async {
    try {
      final uri = Uri.parse(all_news_service);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map;
        final List<dynamic> news = json['articles'];

        final allNewsModel = news.map((item) {
          return NewsModel(
              source: Source(
                  id: item['source']['id'], name: item['source']['name']),
              author: item['author'],
              title: item['title'],
              description: item['description'],
              url: item['url'],
              urlToImage: item['urlToImage'],
              publishedAt: item['publishedAt'],
              content: item['content']);
        }).toList();

        return allNewsModel;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      final uri = Uri.parse(breaking_news_service);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map;
        final List<dynamic> news = json['articles'];

        final allNewsModel = news.map((item) {
          return NewsModel(
              source: Source(
                  id: item['source']['id'], name: item['source']['name']),
              author: item['author'],
              title: item['title'],
              description: item['description'],
              url: item['url'],
              urlToImage: item['urlToImage'],
              publishedAt: item['publishedAt'],
              content: item['content']);
        }).toList();

        return allNewsModel;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }
}
