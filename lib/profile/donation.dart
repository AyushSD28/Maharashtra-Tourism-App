import 'package:flutter/material.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate Now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Support Our Cause',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your donation amount:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount (Rs)',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose a payment method:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            _buildPaymentMethod('Credit/Debit Card'),
            _buildPaymentMethod('PayPal'),
            _buildPaymentMethod('Google Pay'),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final amount = _amountController.text;
                  if (amount.isNotEmpty) {
                    // Implement donation processing logic here
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Thank You!'),
                          content: Text('You donated \$$amount'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Handle empty input
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter an amount.')),
                    );
                  }
                },
                child: const Text('Donate'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(String method) {
    return Card(
      child: ListTile(
        title: Text(method),
        leading: Radio(
          value: method,
          groupValue: null, // Replace with your state management
          onChanged: (value) {
            // Handle payment method selection
          },
        ),
      ),
    );
  }
}
