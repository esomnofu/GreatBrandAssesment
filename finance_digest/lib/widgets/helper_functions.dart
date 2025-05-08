import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

navigateToScreen(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}

Future<void> launchInAppBrowser(String url) async {
  await launchUrl(Uri.parse(url),
      mode: LaunchMode.inAppBrowserView,
      browserConfiguration: BrowserConfiguration(showTitle: true));
}
