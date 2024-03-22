import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';

class AskAiPage extends StatelessWidget {
  const AskAiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [green, green, greenLight],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/images/circlerline.png"),
                Positioned(
                    top: 0,
                    right: 30,
                    child: Container(
                        width: 105,
                        height: 50,
                        decoration: BoxDecoration(
                            color: pureWhite,
                            borderRadius: BorderRadius.circular(60)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "سارة",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                ),
                              ),
                              width4,
                              Text(
                                "مرحبا",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                ),
                              )
                            ],
                          ),
                        ))),
                Container(
                  height: 220,
                  child: Stack(
                    children: [
                      Image.asset("assets/images/logo_2.png"),
                      Positioned(
                        bottom: 0,
                        left: 40,
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/hand_pell.svg"),
                            width4,
                            Text(
                              "ساعد",
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: pureWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            height16,
            Text(
              "أنا ساعد",
              style: TextStyle(
                fontFamily: 'MarkaziText',
                  color: pureWhite, fontWeight: FontWeight.bold, fontSize: 26),
            ),
            Text(
              "كيف يمكنني مساعدتك؟",
              style: TextStyle(
                fontFamily: 'MarkaziText',
                  color: pureWhite, fontWeight: FontWeight.bold, fontSize: 26),
            ),
            height56,
            ElevatedButton(
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/chat.svg")),
            height10,
            Text(
              "انقر للتحدث",
              style: TextStyle(
                  color: pureWhite, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
