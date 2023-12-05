import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final List<String> productImages = [
    'assets/images1/nikepr1.webp',
    'assets/images1/nikepr2.webp',
    "assets/images1/nikepr3.webp",
    "assets/images1/nikepr4.webp",
    "assets/images1/nikepr5.webp",
    "assets/images1/nikepr6.webp"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment(-0.96, 0),
            child: Text("Nike",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                )),
          ),
          Align(
            alignment: Alignment(-0.95, 0),
            child: Text("Nike Air Force 1 '07",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                )),
          ),
          CarouselSlider(
              items: productImages.map((item) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(item,
                        fit: BoxFit.cover,
                        width: size.width,
                        height: size.height),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                aspectRatio: 2.0,
                height: 300,
                viewportFraction: 1,
                autoPlayAnimationDuration: Duration(seconds: 2),
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              )),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: productImages.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => carouselController.animateToPage(entry.key),
            child: Container(
              width: currentIndex == entry.key ? 17 : 7,
              height: 7.0,
              margin: const EdgeInsets.symmetric(
                horizontal: 3.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: currentIndex == entry.key ? Colors.red : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = 0;

                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                    image: AssetImage(productImages[0]),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  image: AssetImage(productImages[1]),
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                  image: AssetImage(productImages[2]),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = 3;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                    image: AssetImage(productImages[3]),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
