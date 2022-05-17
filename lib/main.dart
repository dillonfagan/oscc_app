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
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 80, 127, 161),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
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
