import 'package:finance_digest/modules/models/news.dart';
import 'package:finance_digest/widgets/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsCard extends StatelessWidget {
  final News news;
  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 50,
        shadowColor: Colors.black54,
        color: Colors.black87,
        child: SizedBox(
            width: getScreenWidth(context) - 50,
            height: 150,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Row(
                  children: [
                    ClipRRect(
                        child: Image.network(news.image ?? "",
                            errorBuilder: (context, error, stackTrace) =>
                                Image.network(
                                    "https://www.shutterstock.com/image-vector/vector-oops-symbol-600nw-133546157.jpg"),
                            fit: BoxFit.fill,
                            width: 100,
                            height: 100)),
                    addHorizontalSpacing(20),
                    Expanded(
                      child: SizedBox(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  news.source?.toUpperCase() ?? "",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                Text(
                                    DateFormat('d MMMM y')
                                        .format(news.datetime)
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12))
                              ],
                            ),
                            Text(
                              news.headline ?? "N/A",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
