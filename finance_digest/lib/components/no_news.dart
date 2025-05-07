import 'package:finance_digest/widgets/spacers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoNewsPage extends StatelessWidget {
  final Function? refetchNews;
  const NoNewsPage({super.key, this.refetchNews});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getScreenWidth(context),
      height: getScreenHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                  "https://www.shutterstock.com/image-vector/vector-oops-symbol-600nw-133546157.jpg",
                  fit: BoxFit.cover,
                  width: getScreenWidth(context) - 50,
                  height: 300.0)),
          addVerticalSpacing(10),
          Text(
            "No News Available yet...",
          ),
          addVerticalSpacing(10),
          CupertinoButton(
            onPressed: () => refetchNews!(),
            color: Colors.blue,
            child: Text(
              'Retry',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
