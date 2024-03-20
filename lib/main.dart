import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/views/bottom_nav_bar.dart';
import 'package:medicine_reminder_app/views/first_page.dart';
import 'package:medicine_reminder_app/views/home_page.dart';
import 'package:medicine_reminder_app/views/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseConfiguration();
  DataInjection().setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNav(),
    );
  }
}
