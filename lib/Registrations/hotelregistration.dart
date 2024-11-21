import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:maharashtra/Login/loginPage.dart';

class HotelRegistrationPage extends StatefulWidget {
  const HotelRegistrationPage({super.key});

  @override
  _HotelRegistrationPageState createState() => _HotelRegistrationPageState();
}

class _HotelRegistrationPageState extends State<HotelRegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  File? _image;
  String? _imageUrl;

  // Function to pick a single image using file_picker
  Future<void> _pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        setState(() {
          _image = File(result.files.single.path!);
          _imageUrl = result.files.single.path!;
        });
      } else {
        print("No file selected");
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  // Function to submit form data
  void _submitForm() {
    if (nameController.text.isEmpty ||
        contactController.text.isEmpty ||
        locationController.text.isEmpty ||
        cityController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      _showErrorDialog('Please enter all fields');
      return;
    }

    // Simulate the hotel registration process and navigate to success page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegistrationSuccessPage1(),
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
          'Hotel Registration',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Register Your Hotel',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Hotel Name
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Hotel Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Contact Number
            TextField(
              controller: contactController,
              decoration: InputDecoration(
                labelText: 'Contact Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),

            // Location
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // City
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Description
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Hotel Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),

            // Image Picker
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Text(
                    _image == null ? 'Pick Image' : 'Change Image',
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _imageUrl == null
                ? const Text('No image selected',
                    style: TextStyle(color: Colors.black))
                : Text('Selected Image: $_imageUrl',
                    style: const TextStyle(color: Colors.black)),
            const SizedBox(height: 16),

            // Submit Button
            GestureDetector(
              onTap: _submitForm,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Center(
                  child: Text(
                    'Register Hotel',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
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

class RegistrationSuccessPage1 extends StatelessWidget {
  const RegistrationSuccessPage1({super.key});

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
                'Your Hotel has been Registered Successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Thank you for registering your hotel with Maharashtra Tourism.',
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
