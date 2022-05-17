import 'package:flutter/material.dart';
import 'package:oscc_app/models/schedule/schedule_model.dart';
import 'package:oscc_app/screens/schedule/schedule_screen.dart';
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
          elevation: 0,
        ),
        cardTheme: const CardTheme(
          elevation: 1,
          shadowColor: Color(0xFFFFFFFF),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const ScheduleScreen(),
    );
  }
}
