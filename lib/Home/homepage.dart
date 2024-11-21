import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maharashtra/Home/navbar.dart';
import 'package:maharashtra/Login/loginPage.dart';
import 'package:maharashtra/Userfirstpage/categoriesforuser.dart';
import 'package:maharashtra/profile/profile.dart';

import '../FortClean/fortcleanHome.dart';
import '../profile/donation.dart';
import '../profile/help_and_support.dart';
import '../profile/terms_conditions.dart';

// import './timepass.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
/*
   *Method name build used to
   *make home page of Project MAHARASHTRA  
   * Auther=Prajyot Dhoke
   * date=28/10/2024
   */
  double width1 = 0;
  double width2 = 0;
  double width3 = 0;
  double profileContwidth = 80;
  double profileContheight = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(),
          children: [
            SizedBox(
                height: 182,
                // padding: EdgeInsets.only(top: 0, left: 0),
                child: Stack(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/topback.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 10,
                    // right: 1,
                    top: 55,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return const ProfileUI();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin =
                                  Offset(1.0, 0.0); // Start from right
                              const end =
                                  Offset.zero; // End at the current position
                              const curve = Curves
                                  .easeInOut; // The curve for the animation

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                  position: offsetAnimation, child: child);
                            },
                          ));
                        });
                      },
                      child: AnimatedContainer(
                        clipBehavior: Clip.antiAlias,
                        duration: const Duration(seconds: 2),
                        height: profileContheight,
                        width: profileContwidth,
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.white),
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          "https://cdn-icons-png.flaticon.com/128/2102/2102647.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 130,
                    // bottom: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.oldStandardTt(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Prajyot',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.oldStandardTt(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ])),
            ListTile(
              title: const Text('Donation'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DonationPage()));
              },
            ),
            ListTile(
              title: const Text('Terms & Conditions'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TermsAndConditions()));
              },
            ),
            ListTile(
              title: const Text('Help & Support'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HelpAndSupport()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Log Out'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            expandedHeight: 140,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore Amazing",
                    style: GoogleFonts.quicksand(
                      letterSpacing: 5,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Destinations',
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Discover rare facts and famous places around Maharashtra",
                    style: GoogleFonts.quicksand(
                      fontSize: 12,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              background: Image.asset(
                "assets/topback.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // const SizedBox(
                //   height: 100,
                // ),
                // First Text "Explore Amazing"

                //Scroller
                SizedBox(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 220,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction:
                          0.7, // Set less than 1.0 for visible next/previous items
                      enlargeCenterPage:
                          true, // For a 3D-like scale transformation effect
                      scrollPhysics:
                          const BouncingScrollPhysics(), // Optional for smoother effect
                      aspectRatio: 16 / 9,
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      return Transform.scale(
                        scale: realIndex == index
                            ? 1.0
                            : 0.9, // Provides slight scaling for a 3D effect
                        child: Stack(
                          children: [
                            Container(
                              height: 220,
                              width: MediaQuery.of(context).size.width *
                                  0.7, // Adjusted width for viewport fraction
                              // width: 300,
                              color: Colors.amber,
                              child: Image.asset(
                                "assets/back.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sinhgad Fort",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Pune',
                                          style: GoogleFonts.quicksand(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 100,
                                    ),
                                    Container(
                                      width: 55,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            "4.5",
                                            style: GoogleFonts.quicksand(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w900,
                                              color: const Color.fromARGB(
                                                  255, 227, 201, 2),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: Color.fromARGB(
                                                255, 227, 201, 2),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                // feature hotel Text
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Featured Hotels & Restaurants",
                    style: GoogleFonts.quicksand(
                      fontSize: 22,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                //button set 1
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      //button 1 = luxury hotel
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OptionForUser()));
                          },
                          child: Container(
                            height: 85,
                            width: 187,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(248, 248, 248, 1),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(134, 134, 134, 0.498),
                                    blurRadius: 10,
                                    spreadRadius: 01,
                                    offset: Offset(0, 5),
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.star_border_outlined,
                                    // color: Colors.white,
                                    weight: 50,
                                    size: 30,
                                  ),
                                  Text(
                                    "Luxury Hotels",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                      // color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),

                      //button 2 = Local hotel
                      Expanded(
                        child: Container(
                          height: 85,
                          width: 187,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(134, 134, 134, 0.498),
                                  blurRadius: 10,
                                  spreadRadius: 01,
                                  offset: Offset(0, 5),
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.favorite_border_outlined,
                                  // color: Colors.white,
                                  weight: 50,
                                  size: 30,
                                ),
                                Text(
                                  "Local Favorite's",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    // color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // button set 2
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      //Button 3= RestoBar
                      Expanded(
                        child: Container(
                          height: 85,
                          width: 187,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(134, 134, 134, 0.498),
                                  blurRadius: 10,
                                  spreadRadius: 01,
                                  offset: Offset(0, 5),
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/cocktail.png',
                                  scale: 18,
                                ),
                                Text(
                                  "Resto & Bar",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    // color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      // Button 4= Top Resto
                      Expanded(
                        child: Container(
                          height: 85,
                          width: 187,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(134, 134, 134, 0.498),
                                blurRadius: 10,
                                spreadRadius: 01,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.shopping_cart_outlined,
                                  // color: Colors.white,
                                  weight: 50,
                                  size: 30,
                                ),
                                Text(
                                  "Top Hotels",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    // color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Scroller for hotels
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  height: 220,
                                  width: 300,
                                  // color: Colors.amber,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),

                                  child: Image.asset(
                                    "assets/back.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "World Of Veg",
                                              style: GoogleFonts.quicksand(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "North Indian,Itali  an....",
                                              style: GoogleFonts.quicksand(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'Shivaji Nagar, Pune',
                                              style: GoogleFonts.quicksand(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                          width: 55,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                "4.5",
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w900,
                                                  color: const Color.fromARGB(
                                                      255, 227, 201, 2),
                                                ),
                                              ),
                                              const Icon(
                                                Icons.star,
                                                color: Color.fromARGB(
                                                    255, 227, 201, 2),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Text for guide and trek gropus
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Looking for Guide Or Travel Grp",
                    style: GoogleFonts.quicksand(
                      fontSize: 22,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //scroller for guide
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => SubmissionsPage(submissions: submissions)));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    height: 220,
                                    width: 300,
                                    // color: Colors.amber,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),

                                    child: Image.asset(
                                      "assets/back.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Mr. Xyz",
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "Forts are my Specalitiy",
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'pune',
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                            width: 55,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  "4.5",
                                                  style: GoogleFonts.quicksand(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w900,
                                                    color: const Color.fromARGB(
                                                        255, 227, 201, 2),
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  color: Color.fromARGB(
                                                      255, 227, 201, 2),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Set of local Shop Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () => setState(() {
                                  width1 = 70;
                                  width2 = 0;
                                  width3 = 0;
                                }),
                            child: const Text("City Special")),
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: 10,
                          width: width1,
                          decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () => setState(() {
                                  width2 = 70;
                                  width1 = 0;
                                  width3 = 0;
                                }),
                            child: const Text("Must Vist")),
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: 10,
                          width: width2,
                          decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () => setState(() {
                                  width3 = 70;
                                  width2 = 0;
                                  width1 = 0;
                                }),
                            child: const Text("People's Love")),
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: 10,
                          width: width3,
                          decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ],
                    )
                  ],
                ),
                //Scroll for local Shop
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  height: 220,
                                  width: 300,
                                  // color: Colors.amber,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),

                                  child: Image.asset(
                                    "assets/back.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Joshi's Vada...",
                                              style: GoogleFonts.quicksand(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "Shivaji Nagar Pune",
                                              style: GoogleFonts.quicksand(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 60,
                                        ),
                                        Container(
                                          width: 55,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                "4.5",
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w900,
                                                  color: const Color.fromARGB(
                                                      255, 227, 201, 2),
                                                ),
                                              ),
                                              const Icon(
                                                Icons.star,
                                                color: Color.fromARGB(
                                                    255, 227, 201, 2),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const FortCleanHome();
                          },
                        ),
                      );
                      setState(() {});
                    },
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black12,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Center(
                                  child: Image.asset(
                                    "assets/citadel.png",
                                    scale: 12,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 285,
                                  child: Text(
                                    "Join us:",
                                    style: GoogleFonts.oldStandardTt(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 288,
                                  child: Text(
                                    "\"Be a Hero for History: Fort Clean-Up Drives\"",
                                    style: GoogleFonts.oldStandardTt(
                                        fontSize: 13.4,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "FOLLOW US ON",
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/insta.png"),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/linkedin.png"),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/twitter.png"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
