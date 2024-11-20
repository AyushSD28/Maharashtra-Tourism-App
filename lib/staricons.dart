import 'package:flutter/material.dart';

class Staricons extends StatefulWidget {
  const Staricons({super.key});

  @override
  State<Staricons> createState() => _StariconsState();
}

class _StariconsState extends State<Staricons> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Icon(
          Icons.star_half,
          color: Colors.amber,
        )
      ],
    );
  }
}
