import 'package:flutter/material.dart';
import 'package:my_project/screens/profile_page.dart';
import 'package:my_project/screens/signin_page.dart';
import 'package:my_project/screens/signup_page.dart';
import 'package:my_project/screens/splash_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
