import 'package:finance_digest/widgets/helper_functions.dart';
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          addVerticalSpacing(10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Something went wrong. Please try again later or pull down to refresh,",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
