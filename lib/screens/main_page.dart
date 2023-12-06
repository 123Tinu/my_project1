import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_project/screens/home_test.dart';
import 'package:my_project/screens/profile_page.dart';
import 'package:my_project/screens/settings_page.dart';

import 'cart.dart';
import 'favorates.dart';
import 'home_page.dart';

class ManinPage extends StatefulWidget {
  const ManinPage({super.key});

  @override
  State<ManinPage> createState() => _ManinPageState();
}

class _ManinPageState extends State<ManinPage> {
  static final List<Widget> _pages = <Widget>[
    const HomePageTest(),
    const Favourites(),
    const Cart(),
    const Settings()
  ];
  int _currentSelectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  topRight: Radius.circular(40))),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Stack(children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 60,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(
                        'assets/images1/propic2.jpg',
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Tinu",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const Text(
                "tinu@gmail.com",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.home),
                  onTap: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const HomePageTest();
                        },
                      ));
                    });
                  },
                  title: const Text(
                    "Home",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(Icons.account_box),
                  onTap: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ProfilePage();
                        },
                      ));
                    });
                  },
                  title: const Text(
                    "Accounts",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  onTap: () {},
                  title: const Text(
                    "My Orders",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Settings();
                        },
                      ));
                    });
                  },
                  title: const Text(
                    "Settings",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  onTap: () {},
                  title: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Center(child: _pages[_currentSelectedIndex]),
        bottomNavigationBar: CurvedNavigationBar(
          color: Color.fromARGB(255, 255, 214, 247),
          backgroundColor: Colors.white,
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
