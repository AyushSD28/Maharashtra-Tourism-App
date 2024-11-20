import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Hotelbooking extends StatefulWidget {
  const Hotelbooking({super.key});

  @override
  State<Hotelbooking> createState() => _HotelBookingState();
}

class _HotelBookingState extends State<Hotelbooking> {
  TextEditingController nameController = TextEditingController();
  TextEditingController checkInController = TextEditingController();
  TextEditingController checkOutController = TextEditingController();
  TextEditingController adultController = TextEditingController();
  TextEditingController childrenController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    checkInController.dispose();
    checkOutController.dispose();
    adultController.dispose();
    childrenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Section
          Stack(
            children: [
              SizedBox(
                height: 230,
                width: double.infinity,
                child: Image.asset(
                  "assets/punehotels/Hyattimg/Hyatt3.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 80,
                left: 47,
                child: Text(
                  "Search hotels in Pune",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              const Positioned(
                top: 120,
                left: 78,
                child: Text(
                  "Enter your dates to see the latest price",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              )
            ],
          ),

          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 249, 203, 65),
              child: ListView(
                padding: const EdgeInsets.all(12.0),
                children: [
                  const SizedBox(height: 20),

                  _buildDatePickerField(
                    controller: checkInController,
                    label: "Check-in Date",
                  ),
                  const SizedBox(height: 20),

                  _buildDatePickerField(
                    controller: checkOutController,
                    label: "Check-out Date",
                  ),
                  const SizedBox(height: 20),
                  // Adults
                  _buildBottomSheetField(
                    controller: adultController,
                    label: "Adults",
                    hint: "No. of Adults",
                    options: [
                      "1 Adult",
                      "2 Adults",
                      "3 Adults",
                      "4 Adults",
                      "5 Adults",
                      "6 Adults"
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Children
                  _buildBottomSheetField(
                    controller: childrenController,
                    label: "Children",
                    hint: "No. of Children",
                    options: [
                      "0 Children",
                      "1 Child",
                      "2 Children",
                      "3 Children",
                      "4 Children",
                      "5 Children"
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Search Button
                  ElevatedButton(
                    onPressed: () {
                      // Add search logic here
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    child: const Text(
                      "SEARCH",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Widget _buildDatePickerField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2024),
          lastDate: DateTime(2025),
        );
        if (pickedDate != null) {
          controller.text = DateFormat.yMMMd().format(pickedDate);
        }
      },
    );
  }

  Widget _buildBottomSheetField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required List<String> options,
  }) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixIcon: const Icon(Icons.arrow_drop_down),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(options[index]),
                  onTap: () {
                    controller.text = options[index];
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
