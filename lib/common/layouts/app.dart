import 'package:flutter/material.dart';
import 'package:oscc_app/pages/me/me.dart';
import 'package:oscc_app/pages/rides/rides.dart';
import '../../auth/auth_required_state.dart';

class AppLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppLayoutState();
  }
}

class _AppLayoutState extends AuthRequiredState<AppLayout> {
  int _selectedPage = 0;
  final List<Widget> _pages = [RidesPage(), MePage()];

  void _onNavigationTap(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _pages,
        index: _selectedPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: _onNavigationTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pedal_bike),
            label: 'Rides',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}
