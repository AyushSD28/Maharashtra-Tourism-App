import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maharashtra/Starting/page2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 140,
            ),
            Expanded(
              child: Container(
                height: 500,
                clipBehavior: Clip.antiAlias,
                width: 280,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  "assets/page1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Text(
                  "Welcome to Explore Amazing",
                  style: GoogleFonts.inter(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Text(
                  " Destinations!",
                  style: GoogleFonts.inter(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Discover amazing places, hidden gems around",
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  "the Maharashtra and rare facts.",
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const Page2();
                    },
                  ),
                );
                setState(() {});
              },
              child: Container(
                height: 60,
                width: 360,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(5, 5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Color.fromARGB(143, 97, 97, 97),
                      )
                    ]),
                child: Center(
                  child: Text(
                    "Next",
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
