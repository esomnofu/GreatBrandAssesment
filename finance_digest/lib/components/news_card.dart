import 'package:finance_digest/modules/models/news.dart';
import 'package:finance_digest/widgets/helper_functions.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final News news;
  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.white,
        child: SizedBox(
            width: getScreenWidth(context) - 50,
            height: 300,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(news.image ?? "",
                          fit: BoxFit.cover,
                          width: getScreenWidth(context) - 50,
                          height: 150.0)),
                  addVerticalSpacing(10),
                  Text(
                    news.headline ?? "N/A",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  addVerticalSpacing(10),
                  Expanded(
                    child: Text(
                      news.summary ?? "N?A",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ]))));
  }
}
