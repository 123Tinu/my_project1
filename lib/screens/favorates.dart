import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Favourites",
          style: TextStyle(
              color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 50),
        ),
      ),
    );
  }
}