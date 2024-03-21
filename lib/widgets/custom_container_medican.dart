import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';

class ContainerMedication extends StatelessWidget {
  const ContainerMedication({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(),
      height: context.getHeight() / 10.7,
      alignment: Alignment.centerRight,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("تم أخذ الدواء"),
          width8,
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(shape: BoxShape.circle, color: green),
          ),
          width80,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "الزنك",
                style: TextStyle(
                    fontSize: 15, color: black, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Text(
                    "ص",
                    style: TextStyle(
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
