import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicine_reminder_app/utils/colors.dart';

class PellCount extends StatefulWidget {
  const PellCount({Key? key}) : super(key: key);

  @override
  _PellCountState createState() => _PellCountState();
}

class _PellCountState extends State<PellCount> {
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
           
          
          Text("${_selectedNumber ?? "..."}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("حبة"),
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
                items: List<DropdownMenuItem<int>>.generate(15, (int index) {
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
