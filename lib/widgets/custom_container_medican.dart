import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/model/medicine_model.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/views/medicine/view/edit_medicine_page.dart';
import 'package:medicine_reminder_app/widgets/custom_show_dialog.dart';

class ContainerMedication extends StatelessWidget {
  const ContainerMedication(
      {super.key,
      this.isShowState = false,
      this.isEditState = false,
      required this.medicine,
      this.onTap});

  final bool isShowState;
  final bool isEditState;
  final MedicineModel medicine;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return isShowState
        ? InkWell(
            onTap: onTap,
            child: Container(
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
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return MedicineDialog();
                        },
                      );
                    },
                    child: Text('تنبيه الدواء',
                    style: const TextStyle(
                        fontFamily: 'NotoSansArabic',
                        fontSize: 15,
                        color: Color(0xff504E4E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  width80,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        medicine.name!, // Medicine Name
                        style: const TextStyle(
                            fontSize: 15,
                            color: black,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            medicine
                                .getTimeWithAmPm(medicine.time!), // Time zone
                            style: const TextStyle(
                              fontFamily: 'NotoSansArabic',
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
            ),
          )
        : Container(
            width: context.getWidth(),
            height: context.getHeight() / 9,
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
                InkWell(
                    onTap: () {
                      context.push(
                          view: EditMedicineView(medicine: medicine),
                          isPush: true);
                    },
                    child: Image.asset('assets/images/edit.png')),
                width120,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name!,
                      style: const TextStyle(
                          fontFamily: 'NotoSansArabic',
                          fontSize: 15,
                          color: black,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        const Text(
                          "تم",
                          style: TextStyle(
                            fontFamily: 'NotoSansArabic',
                            fontSize: 15,
                            color: Color(0xff504E4E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        width4,
                        const Text(
                          "•",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff504E4E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        width4,
                        Text(
                          medicine.getTimeWithAmPm(medicine.time!),
                          style: const TextStyle(
                            fontFamily: 'NotoSansArabic',
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
