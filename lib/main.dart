import 'package:flutter/material.dart';
import 'package:oscc_app/models/schedule/schedule_model.dart';
import 'package:oscc_app/screens/screen_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ScheduleModel(),
        ),
      ],
      child: const BikeTeamApp(),
    ),
  );
}

class BikeTeamApp extends StatelessWidget {
  const BikeTeamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OSCC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue[50],
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          backgroundColor: Colors.blue[50],
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          shadowColor: Colors.transparent,
        ),
        cardTheme: const CardTheme(
          elevation: 4.0,
          shadowColor: Color(0xFFFFFFFF),
        ),
      ),
      home: const ScreenController(),
    );
  }
}
