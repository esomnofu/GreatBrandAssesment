import 'package:finance_digest/base/base_screen.dart';
import 'package:finance_digest/components/news_card.dart';
import 'package:finance_digest/modules/news/news_vm.dart';
import 'package:finance_digest/widgets/spacers.dart';
import 'package:flutter/material.dart';

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
          "News Listing",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var news = vm.newsList[index];
                        return NewsListCard(news: news);
                      },
                      separatorBuilder: (ctx, index) => addVerticalSpacing(12),
                      itemCount: vm.newsList.length)
                ],
              ))));
}
