import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_project/screens/splash_screen.dart';
import 'front_page.dart';

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FrontPage()));
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _animationController,
          child: SvgPicture.asset(
            "assets/images1/Shoekeeper_Logo.png", // Replace this with your SVG file path
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}
