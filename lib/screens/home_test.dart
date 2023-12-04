import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_project/screens/navigation_bar.dart';
import 'package:my_project/screens/profile_page.dart';
import 'package:my_project/screens/settings_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_project/screens/test.dart';

class HomePageTest extends StatefulWidget {
  const HomePageTest({super.key});

  @override
  State<HomePageTest> createState() => _HomePageTestState();
}

class _HomePageTestState extends State<HomePageTest> {
  final List<String> shoeNames = [
    'Nike',
    'Adidas Orginals',
    'Nike',
    'New Balance',
  ];
  final List<String> shoeName2 = [
    "Nike Air Force 1 '07",
    "Stan Smith Sneakers",
    "Air Jordan 1 Mid",
    "574 Core "
  ];
  final List<String> shoePrice = [
    "₹ 8195.00",
    "₹ 8999.00",
    "₹ 11495.00",
    "₹ 7499.00"
  ];
  final List<String> shoeImages = [
    "assets/images1/nikeaf1.webp",
    "assets/images1/stanadi.webp",
    "assets/images1/nikejordhan.webp",
    "assets/images1/newbalance2.webp"
  ];
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final List<String> imgList = [
    'assets/images1/bg1.jpeg',
    'assets/images1/bg2.jpeg',
    "assets/images1/bg3.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;
    return Scaffold(
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

      body: ListView(
        children: <Widget>[

          // Adding GridView within the ListView
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: shoeImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 2,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Container(
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Same border radius as Card
                  child: Image.asset(
                    shoeImages[index], // Cycle through the images
                    height: 100,
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                    SizedBox(height: 8), // Adjust spacing as needed
                SizedBox(height: 8),
                Text(
                  shoeNames[index % shoeNames.length],
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  shoeName2[index % shoeName2.length], // Cycle through the shoeName2 list
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  shoePrice[index % shoePrice.length], // Cycle through the shoePrice list
                  style: TextStyle(color: Colors.black),
                ),
                  ],
                ),
              );
            },
          ),
        ],
      ),

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
    );
  }
}
