import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder_app/utils/colors.dart';

class DropMenu extends StatefulWidget {
  const DropMenu({
    Key? key,
  }) : super(key: key);
  @override
  _DropMenuState createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  int _selectedNumberPill = 1;
  int _selectedNumberDay = 1;
  int CountPill = 15;
  int CountDay = 30;
  String pillName = "حبة";
  String dayName = "يوم";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 151,
          height: 48,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset("assets/icons/pells.svg"),
                Text("$_selectedNumberPill"),
                Text(pillName),
                PopupMenuButton<int>(
                  icon: Icon(Icons.arrow_drop_down),
                  itemBuilder: (BuildContext context) {
                    return List<PopupMenuEntry<int>>.generate(CountPill,
                        (int index) {
                      return PopupMenuItem<int>(
                        value: index + 1,
                        child: Row(
                          children: [
                            Text('${index + 1}', textAlign: TextAlign.center),
                          ],
                        ),
                      );
                    });
                  },
                  onSelected: (int value) {
                    setState(() {
                      _selectedNumberPill = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 20,),
        Container(
          width: 151,
          height: 48,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.date_range_rounded, color: grey),
                Text("$_selectedNumberDay"),
                Text(dayName),
                PopupMenuButton<int>(
                  icon: Icon(Icons.arrow_drop_down),
                  itemBuilder: (BuildContext context) {
                    return List<PopupMenuEntry<int>>.generate(CountDay,
                        (int index) {
                      return PopupMenuItem<int>(
                        value: index + 1,
                        child: Row(
                          children: [
                            Text('${index + 1}', textAlign: TextAlign.center),
                          ],
                        ),
                      );
                    });
                  },
                  onSelected: (int value) {
                    setState(() {
                      _selectedNumberDay = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
