import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/views/auth/login_page.dart';
import 'package:medicine_reminder_app/views/otp_view.dart';
import 'package:medicine_reminder_app/widgets/custom_elevated_button.dart';
import 'package:medicine_reminder_app/widgets/custom_text_field.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        leading: IconButton(
            onPressed: () {
              context.push(view: const LoginView(), isPush: false);
            },
            icon:  Icon(Icons.arrow_back,color:  pureWhite)),
        title:  Text("الرجوع", style: TextStyle(color: pureWhite),),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_circle_right_outlined, color: pureWhite,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Center(
            child: Column(
              children: [
                height40,
                CircleAvatar(
                  radius: 100,
                  child: Image.asset(
                    'assets/images/resetpassword.jpg',
                    width: 250,
                    height: 250,
                  ),
                ),
                height32,
                const Text(
                  "إعادة تعيين كلمة المرور",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const Text(
                  "أهلاً بك! فقط أدخل بريدك الإلكتروني، وسنُرسل لك رمز التحقق، لإعادة تعيين كلمة المرور، دعنا نكون جزءًا من الحل لتأمين وصولك وراحتك",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 15),
                ),
                height20,
                TextAuth(
                    // controller: ,
                    hintText: "الايميل",
                    ),
                height20,
                CustomElevatedButton(
                  buttonColor: green,
                  styleColor: white,
                  text: "تابع",
                  onPressed: () {
                    //--TODO: First Step to Reset Password
                    context.push(view: OTPView(), isPush: true);
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
        ),
      ),
    );
  }
}
