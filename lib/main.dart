import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder_app/data_layer/data_layer.dart';
import 'package:medicine_reminder_app/service/database_configuration.dart';
import 'package:medicine_reminder_app/views/auth/bloc/auth_bloc.dart';
import 'package:medicine_reminder_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:medicine_reminder_app/views/bottom_nav_bar/bloc/nav_bar_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(CheckSessionAvailability()),
        ),
        BlocProvider(
          create: (context) => NavBarBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNav(),
      ),
    );
  }
}
