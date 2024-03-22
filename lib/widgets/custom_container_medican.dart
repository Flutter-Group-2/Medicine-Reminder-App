import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/views/edit_medicine_page.dart';

class ContainerMedication extends StatelessWidget {
  ContainerMedication(
      {super.key, this.isShowState = false, this.isEditState = false});

  final bool isShowState;
  final bool isEditState;

  @override
  Widget build(BuildContext context) {
    return isShowState
        ? Container(
            width: context.getWidth(),
            height: context.getHeight() / 10.7,
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("تم أخذ الدواء", style: TextStyle(
                  fontFamily: 'NotoSansArabic',
                ),), // Medicine state
                width8,
                Container(
                  width: 10,
                  height: 10,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: green),
                ),
                width80,
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "الزنك", // Medicine Name
                      style: TextStyle(
                          fontFamily: 'NotoSansArabic',
                          fontSize: 15,
                          color: black,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          "ص", // Time zone
                          style: TextStyle(
                            fontFamily: 'NotoSansArabic',
                            fontSize: 15,
                            color: Color(0xff504E4E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        width4,
                        SizedBox(
                          width: 60,
                          child: Text(
                            "5:30", // Medicine time
                            style: TextStyle(
                              fontFamily: 'NotoSansArabic',
                              fontSize: 15,
                              color: Color(0xff504E4E),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SvgPicture.asset("assets/icons/drugs.svg"),
              ],
            ),
          )
        : Container(
            width: context.getWidth(),
            height: context.getHeight() / 10.7,
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                   InkWell(onTap: () {
                     context.push(view: EditMedicineView(), isPush: true);
                   },child: Image.asset('assets/images/edit.png')),
                width120,
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "الزنك",
                      style: TextStyle(
                          fontFamily: 'NotoSansArabic',
                          fontSize: 15,
                          color: black,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          "تم",
                          style: TextStyle(
                            fontFamily: 'NotoSansArabic',
                            fontSize: 15,
                            color: Color(0xff504E4E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        width4,
                        Text(
                          "•",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff504E4E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        width4,
                        Text(
                          " ص",
                          style: TextStyle(
                            fontFamily: 'NotoSansArabic',
                            fontSize: 15,
                            color: Color(0xff504E4E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        width4,
                        SizedBox(
                          width: 60,
                          child: Text(
                            "5:30",
                            style: TextStyle(
                              fontFamily: 'NotoSansArabic',
                              fontSize: 15,
                              color: Color(0xff504E4E),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SvgPicture.asset("assets/icons/drugs.svg"),
              ],
            ),
          );
  }
}
