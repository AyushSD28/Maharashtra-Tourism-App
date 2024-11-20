import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maharashtra/staricons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ChaturmukhTemple extends StatefulWidget {
  const ChaturmukhTemple({super.key});

  @override
  State<ChaturmukhTemple> createState() => _ChaturmukhTempleState();
}

class _ChaturmukhTempleState extends State<ChaturmukhTemple> {
  List<String> puneImages = [
    "assets/swaminarayan.jpg",
    "assets/swaminarayan2.jpg",
    "assets/swaminarayan3.jpg",
    "assets/swaminarayan4.jpg"
  ];
  PageController pageController1 = PageController();
  int currentIndex = 0;

  void nextImage() {
    if (currentIndex < puneImages.length - 1) {
      pageController1.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void previousImage() {
    if (currentIndex > 0) {
      pageController1.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chaturmukh Temple",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 231, 194, 224),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(3, 3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Stack(
                      children: [
                        PageView.builder(
                            onPageChanged: (int index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            itemCount: puneImages.length,
                            controller: pageController1,
                            itemBuilder: (context, index) {
                              return Image.asset(
                                puneImages[index],
                                fit: BoxFit.cover,
                                height: 300,
                                width: double.infinity,
                              );
                            }),
                        Positioned(
                          left: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 90),
                            child: IconButton(
                              onPressed: previousImage,
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 90),
                            child: IconButton(
                              onPressed: nextImage,
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 160),
                            child: SmoothPageIndicator(
                              controller: pageController1,
                              count: puneImages.length,
                              effect: const WormEffect(
                                dotWidth: 10.0,
                                dotHeight: 10.0,
                                spacing: 8.0,
                                activeDotColor: Colors.blue,
                                dotColor: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "Rating:",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Spacer(),
                  Text("4.5"),
                  Staricons(),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 5, 0),
                child: Text(
                  "The Swaminarayan Temple is a stunning symbol of devotion and cultural artistry, blending intricate carvings, vibrant murals, and traditional architecture. Each element reflects profound spiritual beliefs, while its serene ambiance offers a haven for reflection and peace. The temple stands as a tribute to Swaminarayan's teachings, uniting spirituality, community service, and India's rich cultural heritage in a single breathtaking sanctuary.",
                  style: GoogleFonts.quando(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "           Book Personal Guide         ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 300),
                child: Text(
                  "Reviews:",
                  style: GoogleFonts.quando(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildReviewContainer(),
              _buildReviewContainer(),
              _buildReviewContainer(),
              _buildReviewContainer(),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "           Share Review         ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 226, 212, 224),
    );
  }

  Widget _buildReviewContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color.fromARGB(255, 196, 150, 130),
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
      ),
      height: 110,
      width: 400,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(bottom: 70, right: 5),
            child: Text("Review:"),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 70, right: 5),
            child: Staricons(),
          ),
        ],
      ),
    );
  }
}
