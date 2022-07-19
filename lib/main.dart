import 'package:flutter/material.dart';
import 'package:oscc_app/common/layouts/app.dart';
import 'package:oscc_app/pages/signin/signin.dart';
import 'package:oscc_app/pages/signup/signup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://msiatrcehrxebtqkujbn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1zaWF0cmNlaHJ4ZWJ0cWt1amJuIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTY4NjI2MzAsImV4cCI6MTk3MjQzODYzMH0.kT1dKs9XPFj7OIsw9s0iRsSl3-rAfNBFNcAtlRbx8F0',
  );
  runApp(const BikeTeamApp());
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
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blue,
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
      home: AppLayout(),
      routes: {
        '/login': (context) => const SigninPage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}
