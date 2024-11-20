import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  final Map<String, dynamic> localGuide;

  const BookingPage({super.key, required this.localGuide});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localGuide = widget.localGuide;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book ${localGuide['name']}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Booking for: ${localGuide['name']}",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              "Contact: ${localGuide['contactNumber']}",
              style: const TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Your Name",
                labelStyle: TextStyle(color: Colors.black87),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: dateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Preferred Date",
                labelStyle: TextStyle(color: Colors.black87),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)),
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    dateController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  });
                }
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: timeController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Preferred Time",
                labelStyle: TextStyle(color: Colors.black87),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)),
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  setState(() {
                    timeController.text = pickedTime.format(context);
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  bookLocalGuide(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text(
                  "Confirm Booking",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void bookLocalGuide(BuildContext context) {
    final name = nameController.text;
    final date = dateController.text;
    final time = timeController.text;

    List<Map<String, dynamic>> upcomingBookings = [];

    if (name.isEmpty || date.isEmpty || time.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: const Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.redAccent,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  "Error",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            content: const Text(
              "Please fill out all fields.",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "OK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else {
      upcomingBookings.add({
        'id': DateTime.now().toString(),
        'customer': name,
        'bookingDate': "$date at $time",
        'location': widget.localGuide['location'] ?? 'Not provided',
        'amount': widget.localGuide['rate'] ?? 0,
        'confirmed': false,
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: const Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  "Booking Confirmed",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            content: Text(
              "Your booking with ${widget.localGuide['name']} on $date at $time has been confirmed.",
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
