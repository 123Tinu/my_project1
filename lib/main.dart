import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project/screens/favorates.dart';
import 'package:my_project/screens/home_page.dart';
import 'package:my_project/screens/home_test.dart';
import 'package:my_project/screens/navigation_bar.dart';
import 'package:my_project/screens/product_details_page.dart';
import 'package:my_project/screens/splash_screen.dart';
import 'package:my_project/screens/test.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      home: ProductDetailsPage(),
    );
  }
}
