import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maharashtra/Login/loginPage.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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
                  "assets/page3.jpeg",
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
                  "Join a Tour",
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
                  "Connect with local guides and immerse ",
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  "yourself in the culture.",
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
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                  (route) {
                    return false;
                  },
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
