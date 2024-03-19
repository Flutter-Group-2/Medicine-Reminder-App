import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/views/add_medication_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddMedicationPage(),
    );
  }
}
