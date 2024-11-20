import 'package:flutter/material.dart';

class Ratingstar extends StatefulWidget {
  const Ratingstar({super.key});

  @override
  State<Ratingstar> createState() => _RatingstarState();
}

class _RatingstarState extends State<Ratingstar> {
  bool favouriteIcon = false;
  bool favouriteIcon1 = false;
  bool favouriteIcon2 = false;
  bool favouriteIcon3 = false;
  bool favouriteIcon4 = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              favouriteIcon = !favouriteIcon;
            });
          },
          icon: Icon(
            favouriteIcon ? Icons.star : Icons.star_border_outlined,
            color: favouriteIcon ? Colors.amber : Colors.grey,
          ),
          iconSize: 45.0,
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              favouriteIcon1 = !favouriteIcon1;
            });
          },
          icon: Icon(
            favouriteIcon1 ? Icons.star : Icons.star_border_outlined,
            color: favouriteIcon1 ? Colors.amber : Colors.grey,
          ),
          iconSize: 45.0,
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              favouriteIcon2 = !favouriteIcon2;
            });
          },
          icon: Icon(
            favouriteIcon2 ? Icons.star : Icons.star_border_outlined,
            color: favouriteIcon2 ? Colors.amber : Colors.grey,
          ),
          iconSize: 45.0,
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              favouriteIcon3 = !favouriteIcon3;
            });
          },
          icon: Icon(
            favouriteIcon3 ? Icons.star : Icons.star_border_outlined,
            color: favouriteIcon3 ? Colors.amber : Colors.grey,
          ),
          iconSize: 45.0,
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              favouriteIcon4 = !favouriteIcon4;
            });
          },
          icon: Icon(
            favouriteIcon4 ? Icons.star : Icons.star_border_outlined,
            color: favouriteIcon4 ? Colors.amber : Colors.grey,
          ),
          iconSize: 45.0,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
