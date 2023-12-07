import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_project/screens/settings_page.dart';
import 'cart.dart';
import 'favorites.dart';
import 'home_page.dart';

class BottomNavigationBar1 extends StatefulWidget {
  const BottomNavigationBar1({super.key});

  @override
  State<BottomNavigationBar1> createState() => _BottomNavigationBar1State();
}

class _BottomNavigationBar1State extends State<BottomNavigationBar1> {
  int currentSelectedIndex = 0;
  static final List pages = [HomePage(), favorites(), Cart(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[currentSelectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.white,
        items: const <Widget>[
          Icon(
            color: Colors.red,
            Icons.home,
            size: 30,
          ),
          Icon(
            color: Colors.red,
            Icons.favorite,
            size: 30,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.red,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.red,
          ),
        ],
        onTap: (index) {
          setState(() {
            currentSelectedIndex = index;
          });
        },
      ),
    );
  }
}
