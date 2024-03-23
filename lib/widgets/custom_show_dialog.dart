import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';

class MedicineDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Align(
        alignment: Alignment.centerRight,
        child: Text('حالة تناول الدواء')),
      children: [
        buildDialogOption('تم أخذ الدواء', Colors.green, context),
        buildDialogOption('لم يتم أخذ الدواء', Colors.red, context),
        buildDialogOption('تم التخطي', Colors.orange, context),
      ],
    );
  }

  SimpleDialogOption buildDialogOption(
      String text, Color color, BuildContext context) {
    return SimpleDialogOption(
      onPressed: () {
        Navigator.pop(context, text);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            textAlign: TextAlign.right,
          ),
          width16,
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
        ],
      ),
    );
  }
}
