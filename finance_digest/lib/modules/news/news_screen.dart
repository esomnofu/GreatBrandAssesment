import 'package:finance_digest/base/base_screen.dart';
import 'package:finance_digest/components/news_listing.dart';
import 'package:finance_digest/components/no_news.dart';
import 'package:finance_digest/configs/app_colors.dart';
import 'package:finance_digest/modules/news/news_vm.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<NewsViewModel>(
      vmBuilder: (context) => NewsViewModel(),
      builder: _buildScreen,
    );
  }
}

Widget _buildScreen(BuildContext context, NewsViewModel vm) {
  return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Hey ${vm.firstName}",
        ),
        backgroundColor: AppColors.topHeaderColor,
        titleTextStyle: TextStyle(
            fontSize: 21, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      body: SmartRefresher(
          enablePullDown: true,
          header: WaterDropHeader(waterDropColor: AppColors.topHeaderColor),
          controller: vm.refreshController,
          onRefresh: vm.onRefresh,
          child: vm.newsList.isEmpty
              ? NoNewsPage(
                  refetchNews: () => vm.fetchNewsListing(),
                )
              : NewsListPage(newsList: vm.newsList)));
}
