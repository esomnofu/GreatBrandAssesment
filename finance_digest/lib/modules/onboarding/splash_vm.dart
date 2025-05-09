import 'dart:async';
import 'package:finance_digest/base/base_vm.dart';
import 'package:finance_digest/modules/auth/sign_up_screen.dart';
import 'package:finance_digest/modules/news/news_screen.dart';
import 'package:finance_digest/storage/secure_storage.dart';
import 'package:finance_digest/widgets/helper_functions.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends BaseViewModel {
  final BuildContext context;

  SplashViewModel({required this.context});

  @override
  FutureOr<void> init() async {
    Future.delayed(const Duration(seconds: 3), () async {
      await decideNextSteps();
    });
  }

  Future decideNextSteps() async {
    final fname =
        await SecureStorage.shared().getValue(SecureStorageKeys.firstName);
    final lname =
        await SecureStorage.shared().getValue(SecureStorageKeys.lastName);
    if (context.mounted) {
      if (fname.trim().isNotEmpty && lname.trim().isNotEmpty) {
        navigateToScreenAndRemoveAll(context, NewsScreen());
      } else {
        navigateToScreen(context, SignUpScreen());
      }
    }
  }
}
