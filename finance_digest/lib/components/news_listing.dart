import 'package:finance_digest/components/news_card.dart';
import 'package:finance_digest/modules/models/news.dart';
import 'package:finance_digest/widgets/spacers.dart';
import 'package:flutter/material.dart';

class NewsListPage extends StatelessWidget {
  final List<News> newsList;
  const NewsListPage({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var news = newsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NewsCard(news: news),
                  );
                },
                separatorBuilder: (ctx, index) => addVerticalSpacing(0),
                itemCount: newsList.length)
          ],
        ));
  }
}
