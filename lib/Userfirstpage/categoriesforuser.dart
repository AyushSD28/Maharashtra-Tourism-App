// import 'package:famous_places/Hotels/hotelbooking.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maharashtra/Hotels/Hyaat.dart';
import 'hotellist.dart';

class OptionForUser extends StatefulWidget {
  const OptionForUser({super.key});

  @override
  State<OptionForUser> createState() => _OptionForUserState();
}

class _OptionForUserState extends State<OptionForUser> {
  int selectedIndex = -1;
  List<Hotellist> hotelsCard = [
    Hotellist(
        name: "Hyatt",
        location: "https://maps.app.goo.gl/Dq7rnYwehDdqehRSA",
        image: "assets/punehotels/Hyattimg/Hyatt3.jpg"),
    Hotellist(
        name: "The Ritz-Carlton",
        location: "https://maps.app.goo.gl/krinMaQGZ6XHRtzr9",
        image: "assets/punehotels/ritz5.jpg"),
    Hotellist(
        name: "JW Marriott",
        location: "https://maps.app.goo.gl/krinMaQGZ6XHRtzr9",
        image: "assets/punehotels/jw 1.jpg"),
    Hotellist(
        name: "Conrad Pune",
        location: "https://maps.app.goo.gl/QT8ikVX3QmzvnJvv9",
        image: "assets/punehotels/conrad3.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Heyy... ",
              style: GoogleFonts.quicksand(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Row(
                children: [
                  Text(
                    "Ayush Deshmukh",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.line_axis_sharp)
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 187, 201, 203),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 0.2,
          ),
          // Fixed container

          Expanded(
            child: ListView.builder(
              itemCount: hotelsCard.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HyattHotel()));
                    },
                    // change this
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      height: 250,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 195,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  color: Color.fromARGB(5, 0, 0, 0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        hotelsCard[index].image,
                                        fit: BoxFit.contain,
                                        height: 300,
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 3, left: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      hotelsCard[index].name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color.fromARGB(
                                            255, 26, 119, 30),
                                      ),
                                      height: 25,
                                      width: 48,
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 3),
                                        child: Row(
                                          children: [
                                            Text(
                                              '5.0',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Text(
                                "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 198, 224, 227),
    );
  }
}
