import 'package:flutter/material.dart';

class RareFacts extends StatefulWidget {
  const RareFacts({super.key});

  @override
  State<RareFacts> createState() => _RareFactsState();
}

class _RareFactsState extends State<RareFacts> {
  TextEditingController title = TextEditingController();

  final List<Map<String, String>> facts = [
    {
      "title": "The Great Wall of China",
      "fact":
          "It's not a single wall but a series of walls built over centuries.",
      "image":
          "https://media.istockphoto.com/id/164242812/photo/landscape-of-the-great-wall-of-china.jpg?s=612x612&w=0&k=20&c=Z-whcAI1SdLcScUp4limsYuOCsAwj7xMsRx0yrNW-84=", // Replace with actual image URLs
    },
    {
      "title": "Machu Picchu, Peru",
      "fact": "It was built in the 15th century and abandoned a century later.",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Machu_Picchu%2C_Peru.jpg/1200px-Machu_Picchu%2C_Peru.jpg",
    },
    {
      "title": "The Colosseum, Rome",
      "fact":
          "It could hold up to 80,000 spectators during gladiator contests.",
      "image":
          "https://media.istockphoto.com/id/1194899511/photo/colosseum-in-rome-without-people-in-the-morning-italy.jpg?s=612x612&w=0&k=20&c=t1TYR4w0XZBedjp7riLCQBNoYPpN49TXJKX500B3Hmg=",
    },
    {
      "title": "The Pyramids of Giza, Egypt",
      "fact":
          "The Great Pyramid was the tallest man-made structure for over 3,800 years.",
      "image": "https://www.worldhistory.org/uploads/images/5687.jpg",
    },
    // Add more facts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rare Facts About Historical Places'),
      ),
      body: ListView.builder(
        itemCount: facts.length,
        itemBuilder: (context, index) {
          return _buildFactCard(facts[index]);
        },
      ),
    );
  }

  Widget _buildFactCard(Map<String, String> fact) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(fact["image"] ?? ''),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fact["title"] ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  fact["fact"] ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
