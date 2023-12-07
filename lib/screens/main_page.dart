import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_project/screens/profile_page.dart';
import 'package:my_project/screens/settings_page.dart';
import 'cart.dart';
import 'favorites.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentSelectedIndex = 0;
  static final List pages = [HomePage(), favorites(), Cart(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      drawer: SafeArea(
        child: Drawer(
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
                          return const MainPage();
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
      ),
      body: pages[currentSelectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.transparent,
        items: const <Widget>[
          Icon(
            color: Colors.white,
            Icons.home,
            size: 30,
          ),
          Icon(
            color: Colors.white,
            Icons.favorite,
            size: 30,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.white,
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
