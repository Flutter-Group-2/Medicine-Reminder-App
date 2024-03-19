import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/views/login_page.dart';
import 'package:medicine_reminder_app/widgets/custom_elevated_button.dart';
import 'package:medicine_reminder_app/widgets/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: context.getWidth(),
              height: context.getHeight() / 2.2,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [green, green, greenLight],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/logo_2.png"),
                      radius: 70,
                    ),
                  ),
                  Text(
                    "ساعد",
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  height32,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "تسجيل جديد",
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            height16,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "الإيميل",
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  height10,
                  TextAuth(
                      //  controller: ,
                      ),
                  height26,
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "كلمة المرور",
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  height8,
                  TextAuth(
                      //  controller: ,
                      ),
                  height32,
                  SizedBox(
                    width: context.getWidth() / 1.2,
                    child: CustomElevatedButton(
                        buttonColor: green,
                        text: "تسجيل جديد",
                        styleColor: white),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(view: LoginView(), isPush: false);
                    },
                    child: Text(
                      "هل لديك حساب مسبقًا؟",
                      style: TextStyle(
                        color: green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
