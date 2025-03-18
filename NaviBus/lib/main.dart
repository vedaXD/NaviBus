import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Tracker Login',
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/', // Start at Login
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

