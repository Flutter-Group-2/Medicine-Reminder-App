import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_reminder_app/model/medicine_model.dart';
import 'package:medicine_reminder_app/service/supabase_services.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/views/medicine/bloc/medicine_bloc.dart';
import 'package:medicine_reminder_app/widgets/appBar_arrow_back.dart';
import 'package:medicine_reminder_app/widgets/custom_elevated_button.dart';
import 'package:medicine_reminder_app/widgets/custom_label.dart';
import 'package:medicine_reminder_app/widgets/custom_notification.dart';
import 'package:medicine_reminder_app/widgets/custom_drop_menu.dart';

class EditMedicineView extends StatelessWidget {
  const EditMedicineView({super.key, required this.medicine});
  final MedicineModel medicine;

  @override
  Widget build(BuildContext context) {
    TextEditingController pellName = TextEditingController(text: medicine.name);

    final locator = GetIt.I.get<DBServices>();
    return BlocProvider(
      create: (context) => MedicineBloc(),
      child: BlocBuilder<MedicineBloc, MedicineState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                actions: const [AppBarArrowBack()],
                automaticallyImplyLeading: false),
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
                            borderRadius: BorderRadius.circular(14),
                            color: white),
                        child: SizedBox(
                          height: 48,
                          width: 319,
                          child: TextField(
                            controller: pellName,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              hintText: 'أكتب ...',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(
                                    right: 15, top: 12, bottom: 18),
                                child: SvgPicture.asset(
                                    "assets/icons/drugs.svg"),
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
                      )),
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
                    onPressed: () async {
                      final userId = await locator.getCurrentUserId();
                      //await locator.insertMediationData("", userId, locator.time, locator.pellCount, locator.pellPireod);
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
