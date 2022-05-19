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
        primarySwatch: ThemeColor.primarySwatch,
        scaffoldBackgroundColor: ThemeColor.primarySwatch[100],
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: ThemeColor.primarySwatch[500],
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        cardTheme: const CardTheme(
          elevation: 1,
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

class ThemeColor {
  static MaterialColor get primarySwatch => _getPrimaryColor();

  static MaterialColor _getPrimaryColor() {
    var swatch = Map<int, Color>();
    swatch[50] = const Color.fromARGB(255, 238, 243, 247);
    swatch[100] = const Color.fromARGB(255, 204, 219, 230);
    swatch[200] = const Color.fromARGB(255, 170, 195, 213);
    swatch[300] = const Color.fromARGB(255, 136, 171, 196);
    swatch[400] = const Color.fromARGB(255, 102, 146, 179);
    swatch[500] = const Color.fromARGB(255, 76, 121, 153);
    swatch[600] = const Color.fromARGB(255, 59, 94, 119);
    swatch[700] = const Color.fromARGB(255, 42, 67, 85);
    swatch[800] = const Color.fromARGB(255, 25, 40, 51);
    swatch[900] = const Color.fromARGB(255, 8, 13, 17);

    return MaterialColor(0xFF4C7999, swatch);
  }
}
