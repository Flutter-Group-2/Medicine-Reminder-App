import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/utils/colors.dart';

class DurationOfMedication extends StatefulWidget {
  const DurationOfMedication({Key? key}) : super(key: key);

  @override
  _DurationOfMedicationState createState() => _DurationOfMedicationState();
}

class _DurationOfMedicationState extends State<DurationOfMedication> {
  int _selectedNumber = 1; // Define default value

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 151,
      height: 48,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.date_range_rounded, color: grey),
          Text("${_selectedNumber ?? "..."}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("يوم"),
              DropdownButton<int>(
                menuMaxHeight: 100,
                borderRadius: BorderRadius.circular(20),
                value: _selectedNumber,
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedNumber = newValue;
                    });
                  }
                },
                items: List<DropdownMenuItem<int>>.generate(40, (int index) {
                  return DropdownMenuItem<int>(
                    value: index + 1,
                    child: Text(''),
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
