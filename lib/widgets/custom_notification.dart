import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/utils/colors.dart';

class Notifications extends StatelessWidget {
  const Notifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(),
      height: 48,
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      child:  Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_sharp,color: grey,),
          ),
          const Text(
            "ص",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const Text(
            "00:00",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ],
      ),
    );
  }
}