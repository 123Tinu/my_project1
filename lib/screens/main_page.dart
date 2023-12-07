import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_project/screens/profile_page.dart';
import 'package:my_project/screens/settings_page.dart';
import 'cart.dart';
import 'favorites.dart';
import 'home_page.dart';

class ManinPage extends StatefulWidget {
  const ManinPage({super.key});

  @override
  State<ManinPage> createState() => _ManinPageState();
}

class _ManinPageState extends State<ManinPage> {
  static final List<Widget> _pages =[
    const HomePage(),
    const favorites(),
    const Cart(),
    const Settings()
  ];
  int _currentSelectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: _pages[_currentSelectedIndex]),
        bottomNavigationBar: CurvedNavigationBar(
          color: Color.fromARGB(255, 255, 214, 247),
          backgroundColor: Colors.transparent,
          items: const <Widget>[
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.favorite,
              size: 30,
            ),
            Icon(Icons.shopping_cart, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _currentSelectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
