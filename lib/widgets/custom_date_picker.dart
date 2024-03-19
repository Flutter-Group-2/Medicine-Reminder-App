import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/utils/colors.dart';

class DurationOfMedication extends StatelessWidget {
  const DurationOfMedication({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: const [
        DropdownMenuItem(
          value: '1 day',
          child: Text('1 day'),
        ),
        DropdownMenuItem(
          value: '1 week',
          child: Text('1 week'),
        ),
        DropdownMenuItem(
          value: '1 month',
          child: Text('1 month'),
        ),
        // Add more items as needed
      ],
      onChanged: (String? value) {
        // Handle dropdown item selection
        print('Selected value: $value');
      },
      hint: Container(
        width: 151,
        height: 48,
        decoration:  BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
      ),
    );
  }
}
