import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maharashtra/FamousTemples/Swaminarayantemple.dart';
import 'package:maharashtra/FamousTemples/chaturmukh.dart';
import 'package:maharashtra/FamousTemples/dagdusethhalwai.dart';
import 'package:maharashtra/FamousTemples/iscontemple.dart';
import 'package:maharashtra/FamousTemples/templemodal.dart';
import 'package:maharashtra/Userfirstpage/categoriesforuser.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Punecity extends StatefulWidget {
  const Punecity({super.key});

  @override
  State<Punecity> createState() => _PunecityState();
}

class _PunecityState extends State<Punecity> {
  PageController pageController = PageController();
  int currentPage = 0;
  Timer? time;

  List<String> puneImages = [
    "assets/punecity.jpg",
    "assets/mumbaicity.jpg",
    "assets/amravaticity.jpg",
    "assets/yavatmalimg.jpg",
    "assets/punecity.jpg"
  ];

  @override
  void initState() {
    super.initState();

    time = Timer.periodic(const Duration(milliseconds: 2500), (Timer time) {
      if (currentPage < puneImages.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    time?.cancel();
    super.dispose();
  }

  List<Templemodal> famousTemple = [
    Templemodal(
        tempName: "SWAMINARAYAN",
        tempStatement: "Wonderful and most beautifull  architectural example",
        tempImg: "assets/swaminarayan.jpg",
        tempReview: "5.0"),
    Templemodal(
        tempName: "ISKCON",
        tempStatement: "Wonderful and most beautifull  architectural example",
        tempImg: "assets/swaminarayan.jpg",
        tempReview: "4.5"),
    Templemodal(
        tempName: "DAGDHUSETH HALWAI",
        tempStatement: "Wonderful and most beautifull  architectural example",
        tempImg: "assets/swaminarayan.jpg",
        tempReview: "5.0"),
    Templemodal(
        tempName: "CHATURMUKH",
        tempStatement: "Wonderful and most beautifull  architectural example",
        tempImg: "assets/swaminarayan.jpg",
        tempReview: "4.0")
  ];

  Widget getTemplePage(int index) {
    switch (index) {
      case 0:
        return const SwaminarayanTemple();

      case 1:
        return const IskconTemple();

      case 2:
        return const DagdusethTemple();

      case 3:
        return const ChaturmukhTemple();

      default:
        return const SwaminarayanTemple();
    }
  }

  // void nextImage() {
  //   if (currentIndex < puneImages.length - 1) {
  //     pageController.nextPage(
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeIn,
  //     );
  //   }
  // }

  // void previousImage() {
  //   if (currentIndex > 0) {
  //     pageController.previousPage(
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeIn,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TOP HOTELS",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "Explore the city of Maharaj",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                )
              ],
            ),
            Spacer(),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 227, 219, 219),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 7),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => const OptionForUser()));
          //       },
          //       child: Container(
          //         height: 50,
          //         width: 90,
          //         decoration: const BoxDecoration(
          //           color: Color.fromARGB(255, 231, 231, 231),
          //           boxShadow: [
          //             BoxShadow(
          //               blurRadius: 3,
          //               color: Colors.black,
          //               offset: Offset(3, 3),
          //             )
          //           ],
          //         ),
          //         child: const Padding(
          //           padding: EdgeInsets.only(top: 14, left: 17, right: 2),
          //           child: Text(
          //             " Hotels",
          //             style: TextStyle(
          //                 color: Color.fromARGB(255, 0, 0, 0),
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 15),
          //           ),
          //         ),
          //       ),
          //     ),
          //     SizedBox(width: 90),
          //     Container(
          //       height: 50,
          //       width: 130,
          //       decoration: const BoxDecoration(
          //         color: Color.fromARGB(255, 231, 231, 231),
          //         boxShadow: [
          //           BoxShadow(
          //             blurRadius: 3,
          //             color: Colors.black,
          //             offset: Offset(3, 3),
          //           )
          //         ],
          //       ),
          //       child: const Padding(
          //         padding: EdgeInsets.only(top: 14, left: 23, right: 2),
          //         child: Text(
          //           "Restaurents",
          //           style: TextStyle(
          //               color: Color.fromARGB(255, 0, 0, 0),
          //               fontWeight: FontWeight.bold,
          //               fontSize: 15),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 36),
          //       child: Container(
          //         height: 50,
          //         width: 90,
          //         decoration: const BoxDecoration(
          //           color: Color.fromARGB(255, 231, 231, 231),
          //           boxShadow: [
          //             BoxShadow(
          //               blurRadius: 3,
          //               color: Colors.black,
          //               offset: Offset(3, 3),
          //             )
          //           ],
          //         ),
          //         child: const Padding(
          //           padding: EdgeInsets.only(top: 14, left: 15, right: 2),
          //           child: Text(
          //             "Lounges",
          //             style: TextStyle(
          //                 color: Color.fromARGB(255, 0, 0, 0),
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 15),
          //           ),
          //         ),
          //       ),
          //     ),
          //     SizedBox(width: 120),
          //     Padding(
          //       padding: const EdgeInsets.only(right: 40),
          //       child: Container(
          //         height: 50,
          //         width: 80,
          //         decoration: const BoxDecoration(
          //           color: Color.fromARGB(255, 231, 231, 231),
          //           boxShadow: [
          //             BoxShadow(
          //               blurRadius: 3,
          //               color: Colors.black,
          //               offset: Offset(3, 3),
          //             )
          //           ],
          //         ),
          //         child: const Padding(
          //           padding: EdgeInsets.only(top: 14, left: 15, right: 2),
          //           child: Text(
          //             "Motels",
          //             style: TextStyle(
          //                 color: Color.fromARGB(255, 0, 0, 0),
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 15),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              padding: const EdgeInsets.only(bottom: 1, top: 3),
              height: 200,
              color: const Color.fromARGB(255, 209, 217, 221),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: ClipRRect(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OptionForUser()),
                            );
                          },
                          child: Image.asset("assets/punecity.jpg")),
                    ),
                  ),
                  PageView.builder(
                    controller: pageController,
                    itemCount: puneImages.length,
                    onPageChanged: (int page) {
                      setState(() {});
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        puneImages[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 160, top: 181),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: puneImages.length,
                      effect: const WormEffect(
                          dotWidth: 8,
                          dotHeight: 8,
                          activeDotColor: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "TOP HOTELS",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Type here code for container of temples
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(famousTemple.length, (index) {
                return Container(
                  height: 200,
                  width: 180,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(3, 3),
                      ),
                    ],
                    color: const Color.fromARGB(255, 241, 236, 236),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => getTemplePage(index),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(famousTemple[index].tempImg),
                          )),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          famousTemple[index].tempName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: SizedBox(
                          child: Text(
                            famousTemple[index].tempStatement,
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Reviews:",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue,
                                ),
                                height: 25,
                                width: 48,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        famousTemple[index].tempReview,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.star,
                                        size: 12,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "TOP RESTAURANTS",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(famousTemple.length, (index) {
                return Container(
                  height: 200,
                  width: 180,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(3, 3),
                      ),
                    ],
                    color: const Color.fromARGB(255, 241, 236, 236),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => getTemplePage(index),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(famousTemple[index].tempImg),
                          )),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          famousTemple[index].tempName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: SizedBox(
                          child: Text(
                            famousTemple[index].tempStatement,
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Reviews:",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue,
                                ),
                                height: 25,
                                width: 48,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        famousTemple[index].tempReview,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.star,
                                        size: 12,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "BEST CAFFES",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(famousTemple.length, (index) {
                return Container(
                  height: 200,
                  width: 180,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(3, 3),
                      ),
                    ],
                    color: const Color.fromARGB(255, 241, 236, 236),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => getTemplePage(index),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(famousTemple[index].tempImg),
                          )),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          famousTemple[index].tempName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: SizedBox(
                          child: Text(
                            famousTemple[index].tempStatement,
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Reviews:",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue,
                                ),
                                height: 25,
                                width: 48,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        famousTemple[index].tempReview,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.star,
                                        size: 12,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}
