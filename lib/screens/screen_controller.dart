import 'package:flutter/material.dart';
import 'package:oscc_app/screens/schedule/schedule_screen.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ScreenState();
  }
}

class _ScreenState extends State<ScreenController> {
  final int _selectedScreen = 0;
  final List _screens = [
    const ScheduleScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rides"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _screens[_selectedScreen],
      ),
    );
  }
}
