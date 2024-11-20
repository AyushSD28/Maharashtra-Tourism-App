import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms and Conditions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '1. Introduction\n'
              'These Terms and Conditions govern your use of our application...\n\n'
              '2. Acceptance of Terms\n'
              'By using this app, you agree to these terms...\n\n'
              '3. User Responsibilities\n'
              'Users must not...\n\n'
              '4. Limitation of Liability\n'
              'In no event shall we be liable for...\n\n'
              '5. Changes to Terms\n'
              'We may update our terms from time to time...\n\n'
              '6. Contact Information\n'
              'If you have any questions about these terms, please contact us...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
