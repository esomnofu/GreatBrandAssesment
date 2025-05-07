import 'package:finance_digest/modules/models/news.dart';
import 'package:flutter/material.dart';

class NewsListCard extends StatelessWidget {
  final News news;
  const NewsListCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        news.headline ?? "N/A",
      ),
      subtitle: Text(
        news.summary ?? "N/A",
      ),
      onTap: () {},
    );
  }
}
