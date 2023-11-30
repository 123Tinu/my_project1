import 'package:flutter/material.dart';
import 'package:my_project/screens/profile_page.dart';
import 'package:my_project/screens/settings_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 214, 247),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
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
                          return const HomePage();
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
    );
  }
}
