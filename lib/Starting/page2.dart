import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maharashtra/Starting/page3.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
                  "assets/page2.jpeg",
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
                  "Book Your Stay",
                  style: GoogleFonts.inter(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                // Text(
                //   " Destinations!",
                //   style: GoogleFonts.inter(
                //       fontSize: 25, fontWeight: FontWeight.w600),
                // ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Easily find the best hotels and restaurants ",
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  "at great prices.",
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
                      return const Page3();
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
