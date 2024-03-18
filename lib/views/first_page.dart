import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/views/login_page.dart';
import 'package:medicine_reminder_app/views/siginup_page.dart';
import 'package:medicine_reminder_app/widgets/custom_elevated_button.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      bottomSheet: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
            color: white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            height20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  text: "تسجيل الدخول",
                  buttonColor: green,
                  styleColor: white,
                  onPressed: () {
                    // ** here is logic ** \\
                    context.push(view: LoginView(), isPush: false);
                  },
                )
              ],
            ),
            height20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  text: "تسجيل الدخول كزائر",
                  buttonColor: white,
                  borderColor: green,
                  styleColor: black,
                  onPressed: () {
                    // ** here is logic ** \\
                  },
                )
              ],
            ),
            height20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  text: "تسجيل جديد",
                  buttonColor: green,
                  styleColor: white,
                  onPressed: () {
                    // ** here is logic ** \\
                    context.push(view: SignUpView(), isPush: false);
                  },
                )
              ],
            ),
          ],
        ),
      ),
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [green, green, greenLight],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/logo3.png"),
                radius: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
