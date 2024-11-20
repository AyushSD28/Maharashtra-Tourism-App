import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maharashtra/showbooking/bookpage2.dart';

class BookShow extends StatefulWidget {
  const BookShow({super.key});

  @override
  State<BookShow> createState() => _BookShowState();
}

class _BookShowState extends State<BookShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                "assets/left-arrow.png",
                scale: 20,
                // color: Colors.white54,
              ),
            ),
            pinned: false,
            floating: true,
            expandedHeight: 140,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Welcome",
                style: GoogleFonts.oldStandardTt(
                  letterSpacing: 3,
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              background: Image.asset(
                "assets/threater.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Column(
          //     children: [],
          //   ),
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
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
                                GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const Bookpage2(),
                                    ),
                                  ),
                                  child: Container(
                                    height: 220,
                                    width: MediaQuery.of(context).size.width *
                                        0.7, // Adjusted width for viewport fraction
                                    // width: 300,
                                    color: Colors.amber,
                                    child: Image.network(
                                      "https://imgs.search.brave.com/ZZqhc5yCd46MQX-7SAoscprmmWOzSy9oc9ok5HQHqpI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9hc3Nl/dHNjZG4xLnBheXRt/LmNvbS9pbWFnZXMv/Y2luZW1hL3BodWxs/d2FudGktcG9zdGVy/LTgxOXgxMDI0LS1n/YWxlcnklMjAoMSkt/YWU0NDRhYTAtODZk/Mi0xMWVmLTgwZWUt/NWQ2ZmY1ZTI5Yjdl/LmpwZz9mb3JtYXQ9/d2VicA",
                                      fit: BoxFit.cover,
                                    ),
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
                                              "Pullawanti",
                                              style: GoogleFonts.quicksand(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                              ),
                                            ),
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
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Natak(Play's)",
                            style: GoogleFonts.quicksand(
                              fontSize: 22,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      height: 210,
                                      width: 130,
                                      // color: Colors.amber,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),

                                      child: Image.network(
                                        "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC:w-400.0,h-660.0,cm-pad_resize,bg-000000,fo-top:l-text,ie-U3VuLCAxNyBOb3Y%3D,fs-29,co-FFFFFF,ly-612,lx-24,pa-8_0_0_0,l-end/et00398498-kryslmvmul-portrait.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const Text(
                                      "Show Name",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blueAccent),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Moive's",
                            style: GoogleFonts.quicksand(
                              fontSize: 22,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      height: 250,
                                      width: 330,
                                      // color: Colors.amber,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),

                                      child: Image.network(
                                        "https://imgs.search.brave.com/ZZqhc5yCd46MQX-7SAoscprmmWOzSy9oc9ok5HQHqpI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9hc3Nl/dHNjZG4xLnBheXRt/LmNvbS9pbWFnZXMv/Y2luZW1hL3BodWxs/d2FudGktcG9zdGVy/LTgxOXgxMDI0LS1n/YWxlcnklMjAoMSkt/YWU0NDRhYTAtODZk/Mi0xMWVmLTgwZWUt/NWQ2ZmY1ZTI5Yjdl/LmpwZz9mb3JtYXQ9/d2VicA",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "StandUp's",
                            style: GoogleFonts.quicksand(
                              fontSize: 22,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      height: 250,
                                      width: 330,
                                      // color: Colors.amber,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),

                                      child: Image.network(
                                        "https://assets-in.bmscdn.com/nmcms/events/banner/desktop/media-desktop-bhumi-putra-marathi-stand-up-show-by-pranit-more-0-2024-7-31-t-4-0-13.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Music Show's",
                            style: GoogleFonts.quicksand(
                              fontSize: 22,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      height: 250,
                                      width: 330,
                                      // color: Colors.amber,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),

                                      child: Image.network(
                                        "https://assets-in.bmscdn.com/nmcms/events/banner/desktop/media-desktop-sambata-live-in-pune-0-2024-11-5-t-10-5-1.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
