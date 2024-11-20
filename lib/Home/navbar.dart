import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maharashtra/Treks/trek.dart';
import 'package:maharashtra/punecity.dart';

import '../showbooking/bookpage1.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}
/*
   *BottomNavigation Bar Cotain 
   *5 Icons To Navigate frome Home Page to Othher Page 
   *Container 
   *1)factsPage()
   *2)hotelsPage() 
   *3)homePage()
   *4)trekPage()
   *5)showsPage()
   * Auther==Prajyot Dhoke 
   * Date==28/10/2024 
   */

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 70,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/rareFacts.png",
                      color: Colors.white,
                      scale: 17,
                    ),
                    Text(
                      "Facts",
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                    // Text(
                    //   // Text 2
                    //   "Facts",
                    //   style: GoogleFonts.quicksand(
                    //     color: Colors.white,
                    //     fontSize: 13,
                    //     fontWeight: FontWeight.w700,
                    //   ),
                    // ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const Punecity();
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/fivestarsHotels.png",
                        color: Colors.white,
                        scale: 17,
                      ),
                      Text(
                        "Hotels",
                        style: GoogleFonts.quicksand(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                // Placeholder for spacing the central Home button
                const SizedBox(width: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const TrekPage();
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/trekBook.png",
                        color: Colors.white,
                        scale: 17,
                      ),
                      Text(
                        "Treks",
                        style: GoogleFonts.quicksand(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const BookShow();
                    }));
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/marathishow.png",
                        color: Colors.white,
                        scale: 17,
                      ),
                      Text(
                        "Shows",
                        style: GoogleFonts.quicksand(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Positioned Home button for the elevated look
        Positioned(
          top: -30, // Adjust this value to control overlap
          left: MediaQuery.of(context).size.width / 2 - 25, // Center align
          child: Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // Button background color
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/home.png",
                  color: Colors.black,
                  scale: 10,
                ),
              ),
              Text(
                "Home",
                style: GoogleFonts.quicksand(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
