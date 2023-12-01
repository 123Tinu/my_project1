import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_project/screens/navigation_bar.dart';
import 'package:my_project/screens/profile_page.dart';
import 'package:my_project/screens/settings_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final List<String> imgList = [
    'assets/images1/bg1.jpeg',
    'assets/images1/bg2.jpeg',
    "assets/images1/bg3.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment(-0.96, 0),
              child: Text(
                "Trending Deals",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CarouselSlider(
                items: imgList.map((item) {
                  return SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 500),
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2.0,
                  viewportFraction: 1,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                )),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment(-0.96, 0),
              child: Text(
                "All category",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 40,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Nike")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 40,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Adidas")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 40,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Puma")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 40,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("New Balance")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 40,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Converse")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 40,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Vans")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
        extendBody: true,

        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.black,
          backgroundColor: Colors.white,
          items: const <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite,
              size: 30,
              color: Colors.white,
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
        ),
      ),
    );
  }
}
