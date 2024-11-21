import 'package:flutter/material.dart';
import 'dart:io';

import 'package:maharashtra/Login/loginPage.dart';

class NGORegistrationPage extends StatefulWidget {
  const NGORegistrationPage({super.key});

  @override
  _NGORegistrationPageState createState() => _NGORegistrationPageState();
}

class _NGORegistrationPageState extends State<NGORegistrationPage> {
  TextEditingController ngoNameController = TextEditingController();
  TextEditingController personNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController peopleNeededController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fortNameController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  Future<void> _selectDate(BuildContext context,
      {required TextEditingController controller}) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void _submitForm() {
    if (ngoNameController.text.isEmpty ||
        personNameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        peopleNeededController.text.isEmpty ||
        emailController.text.isEmpty ||
        fortNameController.text.isEmpty ||
        eventDateController.text.isEmpty ||
        dobController.text.isEmpty) {
      _showErrorDialog("Please fill in all fields");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegistrationSuccessPage2(),
      ),
    );
  }

  // Function to show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'NGO Registration',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Register Your NGO',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // NGO Name
            TextField(
              controller: ngoNameController,
              decoration: InputDecoration(
                labelText: 'Name of NGO',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Person Name
            TextField(
              controller: personNameController,
              decoration: InputDecoration(
                labelText: 'Name of Person Registering',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Phone Number
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),

            // Number of People Needed
            TextField(
              controller: peopleNeededController,
              decoration: InputDecoration(
                labelText: 'Number of People Needed',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // Fort Name
            TextField(
              controller: fortNameController,
              decoration: InputDecoration(
                labelText: 'Fort Name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Date of Event Picker
            TextField(
              controller: eventDateController,
              readOnly: true,
              onTap: () =>
                  _selectDate(context, controller: eventDateController),
              decoration: InputDecoration(
                labelText: 'Date of Event',
                filled: true,
                fillColor: Colors.white,
                suffixIcon: const Icon(Icons.calendar_month),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Date of Birth Picker
            TextField(
              controller: dobController,
              readOnly: true,
              onTap: () => _selectDate(context, controller: dobController),
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                filled: true,
                fillColor: Colors.white,
                suffixIcon: const Icon(Icons.calendar_month),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Submit Button
            GestureDetector(
              onTap: _submitForm,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Center(
                  child: Text(
                    'Register NGO',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationSuccessPage2 extends StatelessWidget {
  const RegistrationSuccessPage2({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      // Automatically navigate to login page after 5 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });

    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 80.0, color: Colors.green),
              SizedBox(height: 20),
              Text(
                'Your NGO has been Registered Successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Thank you for registering your NGO with Maharashtra Tourism.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
