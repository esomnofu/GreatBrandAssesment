import 'dart:async';
import 'package:finance_digest/base/base_vm.dart';
import 'package:finance_digest/modules/auth/push_notification_screen.dart';
import 'package:finance_digest/modules/news/news_screen.dart';
import 'package:finance_digest/storage/secure_storage.dart';
import 'package:finance_digest/widgets/helper_functions.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends BaseViewModel {
  final BuildContext context;

  SignUpViewModel({required this.context});

  var firstNameTextEditingController = TextEditingController();
  var lastNameTextEditingController = TextEditingController();

  bool _formIsValid = false;
  bool get formIsValid => _formIsValid;

  @override
  FutureOr<void> init() {}

  void formFilledStatusUpdate() {
    if (firstNameTextEditingController.text.trim().length > 1 &&
        lastNameTextEditingController.text.trim().length > 1) {
      _formIsValid = true;
    } else {
      _formIsValid = false;
    }
    notifyListeners();
  }

  void doLocalSignUp() {
    SecureStorage.shared().writeKey(SecureStorageKeys.firstName,
        firstNameTextEditingController.text.trim());
    SecureStorage.shared().writeKey(
        SecureStorageKeys.lastName, lastNameTextEditingController.text.trim());
    navigateToScreen(context, PushNotificationScreen());
  }
}
