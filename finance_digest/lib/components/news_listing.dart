import 'package:finance_digest/components/news_card.dart';
import 'package:finance_digest/modules/details/web_view_screen.dart';
import 'package:finance_digest/modules/models/news.dart';
import 'package:finance_digest/modules/models/web_view.dart';
import 'package:finance_digest/widgets/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  return GestureDetector(
                    onTap: () async => await launchInAppBrowser(news.url ?? ""),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NewsCard(news: news),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) => addVerticalSpacing(0),
                itemCount: newsList.length)
          ],
        ));
  }
}
