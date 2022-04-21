import 'package:flutter/material.dart';
import 'package:oscc_app/screens/schedule/schedule_screen.dart';

import 'fundraising/fundraising_screen.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ScreenState();
  }
}

class _ScreenState extends State<ScreenController> {
  int _selectedScreen = 0;
  final List _screens = [
    const FundraisingScreen(),
    const ScheduleScreen(),
  ];

  void _updateScreen(int value) {
    setState(() => _selectedScreen = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ocean State Cancer Crushers"),
      ),
      body: _screens[_selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreen,
        onTap: _updateScreen,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_giftcard),
            label: "Fundraising",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "Schedule",
          ),
        ],
        showUnselectedLabels: false,
      ),
    );
  }
}
