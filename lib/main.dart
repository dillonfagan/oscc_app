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
      ),
      home: const ScreenController(),
    );
  }
}
