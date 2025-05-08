import 'dart:async';
import 'package:finance_digest/base/base_vm.dart';
import 'package:finance_digest/modules/news/news_screen.dart';
import 'package:finance_digest/widgets/helper_functions.dart';
import 'package:flutter/material.dart';

class PushNotificationViewModel extends BaseViewModel {
  final BuildContext context;

  PushNotificationViewModel({required this.context});

  @override
  FutureOr<void> init() {}

  void triggerPushNotificationRequest() {
    navigateToScreenAndRemoveAll(context, NewsScreen());
  }
}
