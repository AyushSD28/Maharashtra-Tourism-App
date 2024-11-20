import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
   *appBar for app Containing 
   * Two Text and One Serach Icon
   * and One Drawer Box
   * With background color==black
   * auther=Prajyot Dhoke
   * date==28/10/2024 
   */
class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ), // for Row of App Bar only from Bottom Side
      child: Row(
        // Row USed in title
        children: [
          Column(
            // coloum for alignment of two text
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Heyyy Traveler,", //Text 1
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                //SizedBOx For Spacing between two text
                height: 10,
              ),
              Text(
                // Text 2
                "Prajyot",
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          /*
              *Spacer() for Give Space between Serach Icon and Text
               */
          const Spacer(),

          /**
               * GestureDectector()
               * used for iCon of Search
               */
          GestureDetector(
            child: const Icon(
              /**
                   * Search Icon 
                   */
              Icons.search_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
