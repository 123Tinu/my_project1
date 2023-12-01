import 'package:flutter/material.dart';
class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  final List<String> products = [
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
    'Product 5',
    'Product 6',
    'Product 7',
    'Product 8',
    'Product 9',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of grid columns
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
              productName: products[index]
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;

  const ProductCard({required this.productName});

  @override
  Widget build(BuildContext context) {
    // Replace this with your product card design
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.shopping_cart, size: 50),
            SizedBox(height: 8),
            Text(
              productName,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}