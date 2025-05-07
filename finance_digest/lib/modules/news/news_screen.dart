import 'package:finance_digest/base/base_screen.dart';
import 'package:finance_digest/components/news_card.dart';
import 'package:finance_digest/components/news_listing.dart';
import 'package:finance_digest/components/no_news.dart';
import 'package:finance_digest/modules/news/news_vm.dart';
import 'package:finance_digest/widgets/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<NewsViewModel>(
      vmBuilder: (context) => NewsViewModel(context: context),
      builder: _buildScreen,
    );
  }
}

Widget _buildScreen(BuildContext context, NewsViewModel vm) {
  return Scaffold(
      appBar: AppBar(
        title: Text(
          "General News",
        ),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
            fontSize: 21, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      body: vm.newsList.isEmpty
          ? NoNewsPage(
              refetchNews: () => vm.fetchNewsListing(),
            )
          : SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: WaterDropHeader(waterDropColor: Colors.blue),
              footer: ClassicFooter(),
              controller: vm.refreshController,
              onRefresh: vm.onRefresh,
              child: NewsListPage(newsList: vm.newsList)));
}
