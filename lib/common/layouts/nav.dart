import 'package:flutter/material.dart';
import 'package:oscc_app/common/layouts/main.dart';

class NavLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  const NavLayout({
    required this.title,
    required this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: title,
      body: body,
      bottomNavigationBar: BottomNavigationBar(
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
