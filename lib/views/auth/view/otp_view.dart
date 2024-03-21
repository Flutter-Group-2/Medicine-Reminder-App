import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/views/auth/view/login_page.dart';
import 'package:medicine_reminder_app/views/auth/view/password_change_view.dart';
import 'package:medicine_reminder_app/widgets/custom_elevated_button.dart';
import 'package:medicine_reminder_app/widgets/otp_text_field.dart';
import 'package:timer_button/timer_button.dart';

class OTPView extends StatelessWidget {
  OTPView({super.key});

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();

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
        child: Align(
          alignment: Alignment.centerRight,
          child: Center(
            child: Column(
              children: [
                height32,
                CircleAvatar(
                  radius: 100,
                  child: Image.asset(
                    'assets/images/mail.jpg',
                    width: 250,
                    height: 250,
                  ),
                ),
                height32,
                Container(
                  width: context.getWidth(),
                  height: context.getHeight() * 0.35,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.2),
                    color: grayLight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "تم إرسال رمز التحقق إلى بريدك الإلكتروني لاستعادة كلمة المرور. يرجى التحقق من بريدك الإلكتروني واتباع التعليمات لإكمال عملية استعادة كلمة المرور",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      height20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFieldOTP(
                              controller: controller1,
                              first: true,
                              last: false),
                          TextFieldOTP(
                              controller: controller2,
                              first: false,
                              last: false),
                          TextFieldOTP(
                              controller: controller3,
                              first: false,
                              last: false),
                          TextFieldOTP(
                              controller: controller4,
                              first: false,
                              last: false),
                          TextFieldOTP(
                              controller: controller5,
                              first: false,
                              last: false),
                          TextFieldOTP(
                              controller: controller6,
                              first: false,
                              last: true),
                        ],
                      ),
                      TimerButton.builder(
                          builder: (context, timeLeft) {
                            return TextButton(
                              onPressed: () {}, // Ignore this pressed
                              child: Text(
                                "أعد إرسال رمز التحقق بعد: ${timeLeft + 1}",
                                style: TextStyle(color: green),
                              ),
                            );
                          },
                          onPressed: () {
                            //--TODO: Resend OTP Again
                          },
                          timeOutInSeconds: 60),
                  ],),
                ),
                height20,
                CustomElevatedButton(
                  buttonColor: green,
                  styleColor: white,
                  text: "تابع",
                  onPressed: () {
                    //--TODO: Second Step to Reset Password
                       context.push(view: ChangePasswordView(), isPush: true);
                  },
                ),
                TextButton(onPressed: (){
                   context.push(view: LoginView(), isPush: true);
                }, child: Text("الرجوع الى تسجيل الدخول",style: TextStyle(color: grey),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
