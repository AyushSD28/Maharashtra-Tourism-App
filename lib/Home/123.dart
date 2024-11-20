import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:maharashtra/FortClean/fortcleanHome.dart';
import 'package:maharashtra/Home/appbar.dart';
import 'package:maharashtra/Home/navbar.dart';

// import './timepass.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class CustomAppBarShape extends OutlinedBorder {
  // Implementing the constructor allows the CustomAppBarShape to be
  // properly compared when calling the `identical` method.
  const CustomAppBarShape({super.side});

  Path _getPath(Rect rect) {
    final Path path = Path();
    final Size size = Size(rect.width, rect.height * 1.8);

    final double p0 = size.height * 0.75;
    path.lineTo(0.0, p0);

    final Offset controlPoint = Offset(size.width * 0.4, size.height);
    final Offset endPoint = Offset(size.width, size.height / 2);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect.inflate(side.width));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (rect.isEmpty) {
      return;
    }
    canvas.drawPath(
      getOuterPath(rect, textDirection: textDirection),
      side.toPaint(),
    );
  }

  @override
  ShapeBorder scale(double t) {
    return CustomAppBarShape(side: side.scale(t));
  }

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return CustomAppBarShape(side: side ?? this.side);
  }

  // The lerpFrom method is necessary for the CustomAppBarShape to be
  // properly animated when changing the AppBar shape and when
  // the AppBar is rebuilt.
  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is CustomAppBarShape) {
      return CustomAppBarShape(side: BorderSide.lerp(a.side, side, t));
    }
    return super.lerpFrom(a, t);
  }

  // The lerpTo method is necessary for the CustomAppBarShape to be
  // properly animated when changing the AppBar shape and when
  // the AppBar is rebuilt.
  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is CustomAppBarShape) {
      return CustomAppBarShape(side: BorderSide.lerp(b.side, side, t));
    }
    return super.lerpTo(b, t);
  }
}

class _Home1State extends State<Home1> {
/*
   *Method name build used to
   *make home page of Project MAHARASHTRA  
   * Auther=Prajyot Dhoke
   * date=28/10/2024
   */
  double width1 = 0;
  double width2 = 0;
  double width3 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: const Color.fromARGB(255, 101, 96, 96),
      appBar: AppBar(
        // backgroundColor: Colors.transparent, // background color
        backgroundColor: Colors.black, // background color
        title: const Appbar(),
        // shape: const CustomAppBarShape(),
      ),
      endDrawer: const Drawer(
        // backgroundColor: Colors.white,
        child: Column(
          children: [
            // Container();
          ],
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // child: Image.asset(
            //   fit: BoxFit.cover,
            //   "assets/back.jpg",
            // )
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                // First Text "Explore Amazing"
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explore Amazing",
                        style: GoogleFonts.quicksand(
                          letterSpacing: 5,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Destinations',
                        style: GoogleFonts.quicksand(
                          fontSize: 30,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Dsicover rare facts and famous places around the Maharashtra",
                        style: GoogleFonts.quicksand(
                          fontSize: 13,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                //Scroller
                SizedBox(
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
                                height: 220,
                                width: MediaQuery.of(context).size.width,
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
                                        width: 225,
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
                      Container(
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
                      const SizedBox(
                        width: 20,
                      ),

                      //button 2 = Local hotel
                      Container(
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
                    ],
                  ),
                ),
                // button set 2
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      //Button 3= RestoBar
                      Container(
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
                      const SizedBox(
                        width: 20,
                      ),
                      // Button 4= Top Resto
                      Container(
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
                            Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Center(
                                child: Image.asset(
                                  "assets/citadel.png",
                                  scale: 12,
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
