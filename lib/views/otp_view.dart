import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/views/auth/login_page.dart';
import 'package:medicine_reminder_app/views/otp_view.dart';
import 'package:medicine_reminder_app/widgets/custom_elevated_button.dart';
import 'package:medicine_reminder_app/widgets/custom_text_field.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        leading: IconButton(
            onPressed: () {
              context.push(view: LoginView(), isPush: false);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("الرجوع"),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_circle_right_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 100,
                  child: Image.asset(
                    'assets/images/mail.jpg',
                    width: 250,
                    height: 250,
                  ),
                ),
                height32,
                Text(
                  "إعادة تعيين كلمة المرور",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  "تم إرسال رمز التحقق إلى بريدك الإلكتروني لاستعادة كلمة المرور. يرجى التحقق من بريدك الإلكتروني واتباع التعليمات لإكمال عملية استعادة كلمة المرور",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 15),
                ),
                height20,
                TextAuth(
                    // controller: ,
                    ),
                height20,
                CustomElevatedButton(
                  buttonColor: green,
                  styleColor: white,
                  text: "تابع",
                  onPressed: () {
                    // *** here is Logic *** \\
                //    context.push(view: OTPView(), isPush: true);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
