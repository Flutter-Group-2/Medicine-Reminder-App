import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/utils/colors.dart';

class PellCount extends StatelessWidget {
  const PellCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 151,
      height: 48,
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
    );
  }
}