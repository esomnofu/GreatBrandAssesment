import 'package:finance_digest/modules/models/news.dart';
import 'package:finance_digest/services/base_api_service.dart';
import 'package:flutter/material.dart';

final class NewsApiService {
  static final NewsApiService _sharedInstance = NewsApiService();
  static NewsApiService shared() {
    return _sharedInstance;
  }

  Future<List<News>?> getNewsListing() async {
    try {
      String url = "";
      final response = await ApiService.shared().getRequest(url);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
