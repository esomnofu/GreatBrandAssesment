import 'package:flutter/material.dart';

addVerticalSpacing(double height) {
  return SizedBox(height: height);
}

addHorizontalSpacing(double width) {
  return SizedBox(width: width);
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
