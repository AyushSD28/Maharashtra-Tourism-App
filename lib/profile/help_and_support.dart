import 'package:flutter/material.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help and Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Need Assistance?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Here are some common issues you might encounter:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            _buildIssueCard('How to reset my password?'),
            _buildIssueCard('How to update my profile?'),
            _buildIssueCard('How to contact support?'),
            const SizedBox(height: 20),
            const Text(
              'Contact Us:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement contact support functionality
              },
              child: const Text('Contact Support'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildIssueCard(String issue) {
  return Card(
    child: ListTile(
      title: Text(issue),
      onTap: () {
        // Navigate to detailed issue page or show dialog
      },
    ),
  );
}
