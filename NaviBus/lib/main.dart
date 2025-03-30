import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login.dart';
import 'screens/home_page.dart';
import 'screens/otpverify.dart';
import 'screens/busopts.dart';
import 'screens/payment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Tracker',
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomePage(),
        '/busopts': (context) => BusOptions(),
        '/payment': (context) => const Payment(bus: null),
        '/paymentconfirm': (context) => const Payment(bus: null),
      },
    );
  }
}
