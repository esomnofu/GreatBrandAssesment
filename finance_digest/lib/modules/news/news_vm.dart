import 'dart:async';
import 'package:finance_digest/base/base_vm.dart';
import 'package:finance_digest/modules/models/news.dart';
import 'package:finance_digest/services/news_api_service.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

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
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> fetchNewsListing() async {
    try {
      isLoading = true;
      final newsArray = await NewsApiService.shared().getNewsListing();
      if (newsArray != null) {
        _newsList = newsArray;
        notifyListeners();
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }

  Future<void> onRefresh() async {
    await fetchNewsListing();
    refreshController.refreshCompleted();
  }
}
