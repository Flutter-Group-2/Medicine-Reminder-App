import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/widgets/custom_container_medican.dart';

class MedicineView extends StatelessWidget {
  const MedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            height20,
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "أدويتي",
                style: TextStyle(
                    fontSize: 40, color: black, fontWeight: FontWeight.w600, height: 0.8),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ContainerMedication(
                    isShowState: false,
                  );
                }),
          ],
        ),
      ),
    );
  }
}