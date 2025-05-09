import 'package:finance_digest/base/base_screen.dart';
import 'package:finance_digest/modules/auth/push_vm.dart';
import 'package:finance_digest/widgets/helper_functions.dart';
import 'package:finance_digest/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class PushNotificationScreen extends StatelessWidget {
  const PushNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PushNotificationViewModel>(
      vmBuilder: (context) => PushNotificationViewModel(context: context),
      builder: _buildScreen,
    );
  }
}

Widget _buildScreen(BuildContext context, PushNotificationViewModel vm) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: getScreenHeight(context),
        width: getScreenWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              "assets/images/message.png",
              width: 100,
              height: 100,
            ),
            addVerticalSpacing(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Get the most out of Blott ",
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                  size: 30,
                )
              ],
            ),
            addVerticalSpacing(10),
            Text(
                "Allow notifications to stay in the loop with your payments, requests and groups.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey)),
            Spacer(),
            PrimaryButton(
                title: "Continue",
                onPressed: () async =>
                    await vm.triggerPushNotificationRequest())
          ],
        ),
      ),
    )),
  );
}
