import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/widgets/appBar_arrow_back.dart';
import 'package:medicine_reminder_app/widgets/custom_elevated_button.dart';
import 'package:medicine_reminder_app/widgets/custom_label.dart';
import 'package:medicine_reminder_app/widgets/custom_notification.dart';
import 'package:medicine_reminder_app/widgets/custom_drop_menu.dart';

class AddMedicationPage extends StatelessWidget {
  AddMedicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          actions: const [AppBarArrowBack()], automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            height40,
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "إضافة دواء",
                  style: TextStyle(
                    fontFamily: 'MarkaziText',
                      fontSize: 28, fontWeight: FontWeight.bold),
                )),
            height40,
            const CustomLabel(label: 'إسم الدواء'),
            height10,
            SizedBox(
              height: 48,
              width: 319,
              child: TextField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: 'أكتب ...',
                  suffixIcon:Padding(
                    padding: const EdgeInsets.only(right: 15,top: 12,bottom: 18),
                    child: SvgPicture.asset("assets/icons/drugs.svg"),
                  ),
                  hintTextDirection: TextDirection.rtl,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  filled: true,
                  fillColor: white,
                  alignLabelWithHint: true,
                ),
              ),
            ),
            height48,
            const CustomLabel(
              label: "كم حبة باليوم ومدة الدواء",
            ),
            height10,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropMenu(),
              ],
            ),
            height56,
            const CustomLabel(label: "إشعارات"),
            height10,
            const Notifications(),
            height80,
            CustomElevatedButton(
              text: "إنهاء",
              buttonColor: green,
              styleColor: white,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
