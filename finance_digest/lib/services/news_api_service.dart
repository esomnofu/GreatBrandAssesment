import 'package:finance_digest/configs/app_urls.dart';
import 'package:finance_digest/modules/models/news.dart';
import 'package:finance_digest/services/base_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class NewsApiService {
  static final NewsApiService _sharedInstance = NewsApiService();
  static NewsApiService shared() {
    return _sharedInstance;
  }

  Future<List<News>?> getNewsListing() async {
    try {
      final token = dotenv.env['API_KEY'] ?? '';
      String url =
          "${AppUrl.baseUrl}${AppUrl.newsListUrl}?category=general&token=$token";
      final response = await ApiService.shared().getRequest(url);
      final newsList = newsFromJson(response.body);
      return newsList;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
