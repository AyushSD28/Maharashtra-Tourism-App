import 'package:flutter/material.dart';

class Favouritelist extends StatefulWidget {
  const Favouritelist({super.key});

  @override
  State<Favouritelist> createState() => _FavouritelistState();
}

class _FavouritelistState extends State<Favouritelist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Favourite List",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.grey),
          ),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(height: 15),
            Container(
              height: 145,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Container(
                      height: 125,
                      width: 220,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: const Offset(3, 3),
                        ),
                      ], color: Colors.black),
                      child: ClipRRect(
                        child: Image.asset(
                          "assets/punecity.jpg",
                          width: 200,
                          // height: 200,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1, left: 28),
                          child: Text(
                            "Pune City",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        backgroundColor: Colors.black);
  }
}
