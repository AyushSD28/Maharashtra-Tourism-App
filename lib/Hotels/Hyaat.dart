import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maharashtra/Hotels/hotebooking1.dart';
import 'package:maharashtra/Model%20classes/reviewmodel2.dart';
import 'package:maharashtra/ratingstar.dart';
import 'package:maharashtra/staricons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import "package:intl/intl.dart";
import "dart:io";
import 'package:file_picker/file_picker.dart';

class Hotel {
  final String name;
  final String imagePath;

  Hotel({required this.name, required this.imagePath});
}

class HyattHotel extends StatefulWidget {
  const HyattHotel({super.key});

  @override
  State<HyattHotel> createState() => _HyattHotelState();
}

List<Reviewmodel> reviewCards = [
  Reviewmodel(
    name: "Mahendra",
    date: "16 Nov 2024",
    review: "heloo guys",
  ),
  Reviewmodel(name: "Ayush", date: "28 Feb 2024", review: "best site to see"),
];
TextEditingController dateController = TextEditingController();
TextEditingController reviewController = TextEditingController();

void submit(bool doEdit, BuildContext context, [Reviewmodel? reviewObj]) {
  if (dateController.text.trim().isNotEmpty &&
      reviewController.text.trim().isNotEmpty) {
    if (doEdit) {
      reviewObj!.date = dateController.text;
      reviewObj.review = reviewController.text;
    }
  }
}

///Image picker code

class _HyattHotelState extends State<HyattHotel> {
  List<File> selectedImages = [];

  Future<void> pickMultiImg() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        selectedImages = result.paths.map((path) => File(path!)).toList();
      });
    }
  }

  List<String> puneImages = [
    "assets/punehotels/Hyattimg/Hyatthotel.jpg",
    "assets/punehotels/Hyattimg/Hyatt2.jpg",
    "assets/punehotels/Hyattimg/Hyatt4.jpg"
  ];
  PageController pageController1 = PageController();
  int currentIndex = 0;

  Hotel hyattHotel = Hotel(
    name: "Hyatt",
    imagePath: "assets/punehotels/Hyattimg/Hyatthotel.jpg",
  );
  List<Hotel> favouriteHotels = [];

  bool favouriteIcon = false;

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

  void showBottomSheet(bool doEdit, dynamic context, [Reviewmodel? reviewObj]) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 12.0,
              right: 12.0,
              left: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Share Review",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                ///Title Text Field

                const SizedBox(height: 20),

                const Text("Share Photo's"),
                ElevatedButton(
                  onPressed: pickMultiImg,
                  child: const Text("Pick Images"),
                ),
                const SizedBox(height: 10),
                if (selectedImages.isNotEmpty)
                  SizedBox(
                    height: 100,
                    child: GridView.builder(
                        itemCount: selectedImages.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          return Image.file(
                            selectedImages[index],
                            fit: BoxFit.cover,
                          );
                        }),
                  ),

                ///Description Textfield
                Text(
                  "Your experience",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color.fromRGBO(0, 139, 148, 1.0),
                  ),
                ),
                TextField(
                  controller: reviewController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Date",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color.fromRGBO(0, 139, 148, 1.0),
                  ),
                ),
                TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 139, 148, 1.0),
                        ),
                      ),
                      suffixIcon: const Icon(
                        Icons.calendar_month_outlined,
                      ),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2025),
                      );
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat.yMMMd().format(pickedDate);
                        setState(() {
                          dateController.text = formattedDate;
                        });
                      }
                    }),
                const SizedBox(height: 10),

                const Text(
                  "Rating",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 139, 148, 1.0),
                  ),
                ),
                const SizedBox(height: 5),
                const Ratingstar(),

                ///Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (doEdit == true) {
                        submit(true, reviewObj as BuildContext);
                      } else {
                        submit(false, context);
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color.fromRGBO(0, 139, 148, 1),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Sir.....",
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
        actions: const [
          // IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => FavoritesList(
          //                     favoriteHotels: favouriteHotels,
          //                     favouritLists: [hyattHotel],
          //                   )));
          //     },
          //     icon: const Icon(Icons.favorite_outline_outlined))
        ],
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
                      "HYATT",
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
                  "Hyatt Hotel offers luxurious accommodations with modern amenities, exceptional service, and prime locations, perfect for business and leisure travelers.",
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
              buildReviewContainer(),
              buildReviewContainer(),
              buildReviewContainer(),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showBottomSheet(false, context);
                },
                child: const Text(
                  "           Share Review         ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 226, 212, 224),
    );
  }

  Widget buildReviewContainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///dont write here review directly write review
          const Text(
            "Ayush",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            dateController.text,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color.fromARGB(255, 205, 190, 184),
              // border: Border.all(
              //   width: 1.0,
              //   color: Colors.black,
              // ),
            ),
            height: 150,
            width: 280,
            child: Image.asset("assets/punehotels/Hyattimg/Hyatt4.jpg"),
          ),
          const Row(
            children: [
              Text(
                "Rating:",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 135),
                child: Staricons(),
              ),
            ],
          ),

          ///dont write here review directly write review
          Text(reviewController.text),
          const Text("- - - - - - - - - - - - - - - - - - - - - - - - - - "),

          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
