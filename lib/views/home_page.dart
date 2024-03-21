import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/widgets/custom_container_medican.dart';
import 'package:medicine_reminder_app/widgets/custom_header_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.getWidth(), context.getHeight() / 5.8),
        child: const HeaderHomePage(),
      ),
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
                    fontSize: 24, color: black, fontWeight: FontWeight.w600),
              ),
            ),
            height10,
            ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const ContainerMedication();
                }),
          ],
        ),
      ),
    );
  }
}
