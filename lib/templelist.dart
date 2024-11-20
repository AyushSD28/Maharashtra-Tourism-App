import 'package:flutter/material.dart';
import 'package:maharashtra/datamodel.dart';

void main() {
  runApp(TempleApp());
}

class TempleApp extends StatelessWidget {
  final List<Temple> temples = [
    Temple(
        name: "Shaniwar Wada",
        imageUrl:
            "https://media.istockphoto.com/id/508628776/photo/sunset-over-kandariya-mahadeva-temple.jpg?s=612x612&w=0&k=20&c=YOpVZmLiY4ccl_aoWRJhfqLpNEDgjyOGuTAKbobCO-U=",
        description:
            "A historic fortification in the city of Pune that served as the ",
        location: "Pune,mahrashtra"),
    Temple(
      name: "dagduseth halwai",
      imageUrl:
          "https://media.istockphoto.com/id/508628776/photo/sunset-over-kandariya-mahadeva-temple.jpg?s=612x612&w=0&k=20&c=YOpVZmLiY4ccl_aoWRJhfqLpNEDgjyOGuTAKbobCO-U=",
      description:
          "A historic fortification in the city of Pune that served as the ",
      location: "Pune,mahrashtra",
    ),
  ];

  TempleApp({super.key});
  @override
  Widget build(BuildContext content) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Temple of Maharstra"),
        ),
      ),
    );
  }
}
