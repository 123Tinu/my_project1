import 'package:flutter/material.dart';
import 'package:my_project/screens/favorates.dart';
import 'package:my_project/screens/home_page.dart';
import 'package:my_project/screens/navigation_bar.dart';
import 'package:my_project/screens/splash_screen.dart';
import 'package:my_project/screens/test.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
