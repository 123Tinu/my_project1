import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_project/screens/signin_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 1),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Signin_Page(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
              child: Image(
                  image: AssetImage("assets/images1/Shoekeeper_Logo.png"))),
          CircularProgressIndicator(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
