import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maharashtra/localguid/guideinitial.dart';

class TrekPage extends StatefulWidget {
  const TrekPage({super.key});

  @override
  State<TrekPage> createState() => _TrekPageState();
}

class _TrekPageState extends State<TrekPage> {
  String selectedCategory = 'Trending';

  double widthTrending = 0;
  double widthPersonalGuide = 0;
  double widthGroup = 0;

  final List<Trek> treks = [
    Trek(
        name: 'Mountain Escape',
        category: 'Trending',
        rating: 4.9,
        duration: '3 Days',
        imageUrl: 'assets/treks/mountain.jpg'),
    Trek(
        name: 'Forest Trails',
        category: 'Personal Guide',
        rating: 4.6,
        duration: '2 Days',
        imageUrl: 'assets/treks/forest.jpeg'),
    Trek(
        name: 'Desert Adventure',
        category: 'Travel with Group',
        rating: 4.8,
        duration: '5 Days',
        imageUrl: 'assets/treks/desert.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    List<Trek> filteredTreks = selectedCategory == 'All'
        ? treks
        : treks.where((trek) => trek.category == selectedCategory).toList();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      appBar: AppBar(
        title: const Text("Explore Treks"),
        actions: [
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnboardingGuide()));
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search treks...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  top: 8, left: 16, right: 16, bottom: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryButton("Trending", () {
                      setState(() {
                        widthTrending = 70;
                        widthPersonalGuide = 0;
                        widthGroup = 0;
                        selectedCategory = 'Trending';
                      });
                    }, widthTrending),
                    _buildCategoryButton("Personal Guide", () {
                      setState(() {
                        widthTrending = 0;
                        widthPersonalGuide = 70;
                        widthGroup = 0;
                        selectedCategory = 'Personal Guide';
                      });
                    }, widthPersonalGuide),
                    _buildCategoryButton("Travel with Group", () {
                      setState(() {
                        widthTrending = 0;
                        widthPersonalGuide = 0;
                        widthGroup = 70;
                        selectedCategory = 'Travel with Group';
                      });
                    }, widthGroup),
                  ])),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTreks.length,
              itemBuilder: (context, index) {
                return TrekListItem(trek: filteredTreks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String title, VoidCallback onTap, double width) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: 10,
          width: width,
          decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ],
    );
  }
}

class TrekListItem extends StatelessWidget {
  final Trek trek;

  const TrekListItem({super.key, required this.trek});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade50, Colors.green.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                trek.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        trek.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    trek.duration,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  RatingBarIndicator(
                    rating: trek.rating,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Trek {
  final String name;
  final String category;
  final double rating;
  final String duration;
  final String imageUrl;

  Trek({
    required this.name,
    required this.category,
    required this.rating,
    required this.duration,
    required this.imageUrl,
  });
}
