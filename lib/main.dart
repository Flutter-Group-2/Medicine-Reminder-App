import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/service/database_configuration.dart';
import 'package:medicine_reminder_app/views/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseConfiguration();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
