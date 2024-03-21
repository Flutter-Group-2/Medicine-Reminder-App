import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/views/auth/view/login_page.dart';
import 'package:medicine_reminder_app/widgets/custom_elevated_button.dart';
import 'package:medicine_reminder_app/widgets/custom_text_field.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: green,
        leading: IconButton(
            onPressed: () {
              context.push(view: const LoginView(), isPush: false);
            },
            icon: Icon(Icons.arrow_back, color: pureWhite)),
        title: Text(
          "الرجوع",
          style: TextStyle(color: pureWhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "كلمة المرور الجديدة",
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            height10,
            TextAuth(
              hintText: "كلمة المرور",
            ),
            height20,
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "تأكيد كلمة المرور",
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            height10,
            TextAuth(
              hintText: "تاكيد كلمة المرور",
            ),
            height20,
            CustomElevatedButton(
              buttonColor: green,
              styleColor: white,
              text: "تابع",
              onPressed: () {
                //--TODO: Third Step to Reset Password
                context.push(view: LoginView(), isPush: true);
              },
            ),
            TextButton(
                onPressed: () {
                  context.push(view: LoginView(), isPush: true);
                },
                child: Text(
                  "الرجوع الى تسجيل الدخول",
                  style: TextStyle(color: grey),
                ))
          ],
        ),
      ),
    );
  }
}
