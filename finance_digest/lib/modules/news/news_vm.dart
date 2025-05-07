import 'dart:async';
import 'package:finance_digest/base/base_vm.dart';
import 'package:finance_digest/modules/models/news.dart';
import 'package:finance_digest/services/news_api_service.dart';
import 'package:flutter/material.dart';

class NewsViewModel extends BaseViewModel {
  BuildContext context;

  NewsViewModel({
    required this.context,
  });

  @override
  FutureOr<void> init() async {
    await fetchNewsListing();
  }

  List<News> _newsList = [];
  List<News> get newsList => _newsList;

  Future<void> fetchNewsListing() async {
    try {
      isLoading = true;
      //api call
      final response = await NewsApiService.shared().getNewsListing();
      _newsList = [
        News(
            category: "top news",
            id: 21,
            image:
                "https://static2.finnhub.io/file/publicdatany/finnhubimage/market_watch_logo.png",
            headline: "A new market",
            summary: "Its a new outstanding story"),
        News(
            category: "great news",
            id: 21,
            image:
                "https://static2.finnhub.io/file/publicdatany/finnhubimage/market_watch_logo.png",
            headline: "A second market",
            summary: "Its another great story"),
      ];
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }
}
