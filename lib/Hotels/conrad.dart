import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maharashtra/Hotels/hotelbooking.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Hotel {
  final String name;
  final String imagePath;

  Hotel({required this.name, required this.imagePath});
}

class ConradHotel extends StatefulWidget {
  const ConradHotel({super.key});

  @override
  State<ConradHotel> createState() => _HyattHotelState();
}

class _HyattHotelState extends State<ConradHotel> {
  List<String> puneImages = [
    "assets/punehotels/Conradimg/conrad1.jpg",
    "assets/punehotels/Conradimg/conrad3.jpg",
    "assets/punehotels/Conradimg/conrad2.jpg"
  ];
  PageController pageController1 = PageController();
  int currentIndex = 0;
  bool favouriteIcon = false;

  Hotel hyattHotel = Hotel(
    name: "Hyatt",
    imagePath: "assets/punehotels/Hyattimg/Hyatthotel.jpg",
  );
  List<Hotel> favouriteHotels = [];

  void toggleFavourite() {
    setState(() {
      favouriteIcon = !favouriteIcon;
      if (favouriteIcon) {
        favouriteHotels.add(hyattHotel);
      } else {
        favouriteHotels.remove(hyattHotel);
      }
    });
  }

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
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Sir",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Ayush Deshmukh",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 231, 194, 224),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Row(
                  children: [
                    const Text(
                      "CONRAD",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          favouriteIcon = !favouriteIcon;
                        });
                      },
                      icon: Icon(
                        favouriteIcon ? Icons.favorite : Icons.favorite_outline,
                        color: favouriteIcon ? Colors.red : Colors.grey,
                      ),
                      iconSize: 30.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: PageView.builder(
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: puneImages.length,
                  controller: pageController1,
                  itemBuilder: (context, index) {
                    return Container(
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
                            Image.asset(
                              puneImages[index],
                              fit: BoxFit.cover,
                              height: 300,
                              width: double.infinity,
                            ),
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
                              left: 180,
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
                          ],
                        ),
                      ),
                    );
                  },
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
                  Text("5"),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 5, 0),
                child: Text(
                  "Conrad Hotel offers luxurious accommodations with modern amenities, exceptional service, and prime locations, perfect for business and leisure travelers.",
                  style: GoogleFonts.quando(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Hotelbooking()));
                },
                child: const Text(
                  "           Book Hotel         ",
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
        color: const Color.fromARGB(255, 205, 190, 184),
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
            padding: EdgeInsets.only(bottom: 70),
            child: Row(
              children: [
                Text("5"),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
