import 'package:flutter/material.dart';
import 'package:my_project/screens/login_page_1.dart';
import 'package:my_project/screens/signin_page_1.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage1());
  }
}
