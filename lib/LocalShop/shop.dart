import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LocalShopsScreen extends StatefulWidget {
  const LocalShopsScreen({super.key});

  @override
  State<LocalShopsScreen> createState() => _LocalShopsScreenState();
}

class _LocalShopsScreenState extends State<LocalShopsScreen> {
  String selectedCategory = 'All';

  double width1 = 0;
  double width2 = 0;
  double width3 = 0;

  final List<Shop> shops = [
    Shop(
      name: 'Baker’s Delight',
      category: 'Bakery',
      categoryType: 'City Special',
      rating: 4.5,
      distance: '0.5 km',
      imageUrl: 'assets/bakery.jpg',
      hasOffer: true,
    ),
    Shop(
      name: 'Green Grocery',
      category: 'Grocery',
      categoryType: 'Most Visited',
      rating: 4.2,
      distance: '1.2 km',
      imageUrl: 'assets/grocery.jpg',
      hasOffer: false,
    ),
    Shop(
      name: 'Cafe Mocha',
      category: 'Cafe',
      categoryType: 'People\'s Love',
      rating: 4.8,
      distance: '0.8 km',
      imageUrl: 'assets/cafe.png',
      hasOffer: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Shop> filteredShops = selectedCategory == 'All'
        ? shops
        : shops.where((shop) => shop.categoryType == selectedCategory).toList();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      appBar: AppBar(
        title: const Text("Local Shops"),
        actions: [
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {},
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
                hintText: "Search shops...",
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
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () => setState(() {
                                  width1 = 70;
                                  width2 = 0;
                                  width3 = 0;
                                  selectedCategory = 'City Special';
                                }),
                            child: const Text(
                              "City Special",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            )),
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
                                  selectedCategory = 'Most Visited';
                                }),
                            child: const Text("Most Visited",
                                style: TextStyle(fontWeight: FontWeight.w800))),
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
                                  selectedCategory = 'People\'s Love';
                                }),
                            child: const Text("People's Love",
                                style: TextStyle(fontWeight: FontWeight.w800))),
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
                  ])),
          Expanded(
            child: ListView.builder(
              itemCount: filteredShops.length,
              itemBuilder: (context, index) {
                return ShopListItem(shop: filteredShops[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShopListItem extends StatelessWidget {
  final Shop shop;

  const ShopListItem({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
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
                shop.imageUrl,
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
                        shop.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (shop.hasOffer)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Offer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.storefront,
                            color: Colors.grey[600],
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            shop.category,
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        shop.distance,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: shop.rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${shop.rating}",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
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

class Shop {
  final String name;
  final String category;
  final String categoryType;
  final double rating;
  final String distance;
  final String imageUrl;
  final bool hasOffer;

  Shop({
    required this.name,
    required this.category,
    required this.categoryType,
    required this.rating,
    required this.distance,
    required this.imageUrl,
    required this.hasOffer,
  });
}
