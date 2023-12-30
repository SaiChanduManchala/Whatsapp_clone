import 'package:flutter/material.dart';
import 'package:whatsapp_clone/NewScreen/LandingScreen.dart';
import 'Screens/HomeScreen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color(0xFF075E54),
          accentColor: const Color(0xFF128C7E)),
        home: LandingScreen(),
    );
  }
}

