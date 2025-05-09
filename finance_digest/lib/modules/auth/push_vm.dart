import 'dart:async';
import 'package:finance_digest/base/base_vm.dart';
import 'package:finance_digest/modules/news/news_screen.dart';
import 'package:finance_digest/widgets/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class PushNotificationViewModel extends BaseViewModel {
  final BuildContext context;

  PushNotificationViewModel({required this.context});

  @override
  FutureOr<void> init() {}

  Future triggerPushNotificationRequest() async {
    await Permission.notification.onDeniedCallback(() {
      gotoNewsScreen();
    }).onGrantedCallback(() {
      gotoNewsScreen();
    }).onPermanentlyDeniedCallback(() {
      gotoNewsScreen();
    }).onRestrictedCallback(() {
      gotoNewsScreen();
    }).onLimitedCallback(() {
      gotoNewsScreen();
    }).onProvisionalCallback(() {
      gotoNewsScreen();
    }).request();
  }

  void gotoNewsScreen() {
    //Show a cupertino alert instead of implementing a firebase push notification implementation
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('"Blott" Would Like to Send You Notifications'),
        content: Text(
            "Notifications may include alerts, sounds, and icon badges. These can be configured in Settings."),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text("Don't Allow"),
            onPressed: () =>
                navigateToScreenAndRemoveAll(context, NewsScreen()),
          ),
          CupertinoDialogAction(
            child: Text("Allow"),
            onPressed: () =>
                navigateToScreenAndRemoveAll(context, NewsScreen()),
          ),
        ],
      ),
    );
  }
}
