import 'package:flutter/foundation.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/news_service.dart';


class NewsProvider extends ChangeNotifier {
  List<NewsModel> _allNews = [];

  List<NewsModel> get allNews => _allNews;

  final _service = NewsService();

  List<NewsModel> _breakingNews = [];

  List<NewsModel> get breakingNews => _breakingNews;

  Future<void> getAllNews() async {
    final response = await _service.getEverything();
    _allNews = response;
    notifyListeners();
  }

  Future<void> getBreakingNews() async {
    final response = await _service.getBreakingNews();
    _breakingNews = response;
    notifyListeners();
  }
}
