import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        color: green,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -45,
            left: 30,
            child: Container(
              width: 112,
              height: 140,
              decoration: BoxDecoration(
                color: pureWhite,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Center(
                child: Column(
                  children: [
                    height16,
                    Image.asset(
                      'assets/images/logo.png',
                      width: 83,
                      height: 87,
                    ),
                    Text(
                      'ساعد',
                      style: TextStyle(
                          fontSize: 25,
                          color: green,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: SizedBox(
              width: 100,
              height: 100,
              child: Text(
                "مرحبا \nسارة ",
                style: TextStyle(
                    fontSize: 30,
                    color: pureWhite,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 30,
            child: SizedBox(
              width: 100,
              height: 100,
              child: Text(
                "ًُ",
                style: TextStyle(
                    fontSize: 40,
                    color: pureWhite,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            child: Container(
              width: 26,
              height: 26,
              decoration:
                  BoxDecoration(border: Border.all(color: orang, width: 0.8)),
              child: Center(
                  child: Text(
                "E",
                style: TextStyle(
                    fontSize: 13,
                    color: pureWhite,
                    fontWeight: FontWeight.w500),
              )),
            ),
          )
        ],
      ),
    );
  }
}
