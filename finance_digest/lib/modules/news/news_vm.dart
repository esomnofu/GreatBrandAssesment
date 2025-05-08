import 'dart:async';
import 'package:finance_digest/base/base_vm.dart';
import 'package:finance_digest/modules/models/news.dart';
import 'package:finance_digest/services/news_api_service.dart';
import 'package:finance_digest/storage/secure_storage.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class NewsViewModel extends BaseViewModel {
  NewsViewModel();

  @override
  FutureOr<void> init() async {
    await getFirstName();
    await fetchNewsListing();
  }

  String _firstName = "";
  String get firstName => _firstName;
  Future getFirstName() async {
    _firstName =
        await SecureStorage.shared().getValue(SecureStorageKeys.firstName);
    notifyListeners();
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
