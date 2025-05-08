import 'package:finance_digest/base/base_screen.dart';
import 'package:finance_digest/modules/auth/sign_up_vm.dart';
import 'package:finance_digest/widgets/bottom_border_textfield.dart';
import 'package:finance_digest/widgets/helper_functions.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      vmBuilder: (context) => SignUpViewModel(context: context),
      builder: _buildScreen,
    );
  }
}

Widget _buildScreen(BuildContext context, SignUpViewModel vm) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your legal name",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          addVerticalSpacing(10),
          Text(
              "We need to know a bit about you so that we can create your account.",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey)),
          addVerticalSpacing(50),
          BottomBorderTextField(
            textController: vm.firstNameTextEditingController,
            hinttext: "First name",
            hintColor: Colors.grey,
            onChanged: (p0) => vm.formFilledStatusUpdate(),
          ),
          addVerticalSpacing(40),
          BottomBorderTextField(
            textController: vm.lastNameTextEditingController,
            hinttext: "Last name",
            hintColor: Colors.grey,
            onChanged: (p0) => vm.formFilledStatusUpdate(),
          )
        ],
      ),
    )),
    floatingActionButton: vm.formIsValid
        ? GestureDetector(
            onTap: () => vm.doLocalSignUp(),
            child: Image.asset(
              "assets/images/fab_pass.png",
              width: 70,
              height: 70,
            ))
        : Image.asset(
            "assets/images/fab_fail.png",
            width: 70,
            height: 70,
          ),
  );
}
