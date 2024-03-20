import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/views/auth/bloc/auth_bloc.dart';
import 'package:medicine_reminder_app/views/auth/siginup_page.dart';
import 'package:medicine_reminder_app/views/bottom_nav_bar.dart';
import 'package:medicine_reminder_app/widgets/custom_elevated_button.dart';
import 'package:medicine_reminder_app/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccessState) {
                context.push(view: BottomNav(), isPush: true);
                context.getMessages(msg: state.msg, color: green);
              } else if (state is AuthErrorState) {
                context.getMessages(msg: state.msg, color: red);
              }
            },
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
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
                            backgroundImage:
                                AssetImage("assets/images/logo_2.png"),
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
                            "تسجيل الدخول",
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
                          controller: emailController,
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
                          isSecure: true,
                          controller: passwordController,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "هل نسيت كلمة المرور؟",
                              style: TextStyle(
                                color: green,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        height10,
                        SizedBox(
                          width: context.getWidth() / 1.2,
                          child: CustomElevatedButton(
                              buttonColor: green,
                              onPressed: () {
                                context.read<AuthBloc>().add(LoginEvent(
                                    email: emailController.text,
                                    password: passwordController.text));
                              },
                              text: "تسجيل الدخول",
                              styleColor: white),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'هل يوجد لديك حساب؟ ',
                            style: const TextStyle(
                              color: black,
                              fontSize: 16,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'سجل الآن',
                                style: TextStyle(
                                  color: green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.push(
                                        view: SignUpView(), isPush: false);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
