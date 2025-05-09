import 'package:finance_digest/base/base_screen.dart';
import 'package:finance_digest/modules/onboarding/splash_vm.dart';
import 'package:finance_digest/widgets/helper_functions.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      vmBuilder: (context) => SplashViewModel(context: context),
      builder: _buildScreen,
    );
  }
}

Widget _buildScreen(BuildContext context, SplashViewModel vm) {
  return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
          height: getScreenHeight(context),
          width: getScreenWidth(context),
          child: Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 200,
              height: 200,
            ),
          )));
}
