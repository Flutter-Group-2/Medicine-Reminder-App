import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/model/medicine_model.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';

class ContainerMedication extends StatelessWidget {
  ContainerMedication(
      {super.key, this.isShowState = false, this.isEditState = false,required this.medicine});

  final bool isShowState;
  final bool isEditState;
final MedicineModel medicine;
  @override
  Widget build(BuildContext context) {
    return isShowState
        ? Container(
            width: context.getWidth(),
            height: context.getHeight() / 9,
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
                const Text("تم أخذ الدواء"), // Medicine state
                width8,
                Container(
                  width: 10,
                  height: 10,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: green),
                ),
                width80,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name!, // Medicine Name
                      style: TextStyle(
                          fontSize: 15,
                          color: black,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          medicine.getTimeWithAmPm(medicine.time!), // Time zone
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff504E4E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        width4,
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
            height: context.getHeight() / 9,
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
                   Image.asset('assets/images/edit.png'),
                width120,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name!,
                      style: TextStyle(
                          fontSize: 15,
                          color: black,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          "تم",
                          style: TextStyle(
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
                        Text(
                          medicine.getTimeWithAmPm(medicine.time!),
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff504E4E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        width4,
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
