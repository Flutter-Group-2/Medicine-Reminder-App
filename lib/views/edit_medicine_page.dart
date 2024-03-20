import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/widgets/appBar_arrow_back.dart';
import 'package:medicine_reminder_app/widgets/duration_of_medication.dart';
import 'package:medicine_reminder_app/widgets/custom_elevated_button.dart';
import 'package:medicine_reminder_app/widgets/custom_label.dart';
import 'package:medicine_reminder_app/widgets/custom_notification.dart';
import 'package:medicine_reminder_app/widgets/custom_pell_count.dart';

class EditMedicineView extends StatelessWidget {
  const EditMedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "تعديل الدواء",
                  style: GoogleFonts.poppins(
                      fontSize: 28, fontWeight: FontWeight.bold),
                )),
            height40,
            const CustomLabel(label: 'إسم الدواء'),
            height10,
            SizedBox(
                height: 48,
                width: 319,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14), color: white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text("الزنك",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                        ),
                        SvgPicture.asset("assets/icons/drugs.svg"),
                      ],
                    ),
                  ),
                )),
            height48,
            const CustomLabel(
              label: "كم حبة باليوم ومدة الدواء",
            ),
            height10,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PellCount(),
                DurationOfMedication(),
              ],
            ),
            height56,
            const CustomLabel(label: "إشعارات"),
            height10,
            const Notifications(),
            height80,
            CustomElevatedButton(
              text: "حفظ",
              buttonColor: green,
              styleColor: white,
              onPressed: () {
                // ** here is logic ** \\
              },
            ),
            height10,
            CustomElevatedButton(
              text: "حذف",
              buttonColor: pureWhite,
              styleColor: black,
              borderColor: green,
              onPressed: () {
                // ** here is logic ** \\
              },
            )
          ],
        ),
      ),
    );
  }
}
