import 'package:flutter/material.dart';
import 'package:maharashtra/showbooking/bookpage4.dart';

class Bookpage3 extends StatefulWidget {
  const Bookpage3({super.key});

  @override
  State<Bookpage3> createState() => _Bookpage3State();
}

class _Bookpage3State extends State<Bookpage3> {
  // Move count to a class-level variable

  List<List<int>> seats = [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
  ];

  void toggleSeatSelection(int row, int col) {
    setState(() {
      if (seats[row][col] == 0) {
        seats[row][col] = 1; // Select the seat
      } else if (seats[row][col] == 1) {
        seats[row][col] = 0; // Deselect the seat
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Seat Booking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Your Seats',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // Number of seats per row
                  childAspectRatio: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: seats.length * seats[0].length,
                itemBuilder: (context, index) {
                  int row = index ~/ seats[0].length;
                  int col = index % seats[0].length;

                  Color seatColor;
                  if (seats[row][col] == -1) {
                    seatColor = Colors.grey; // Reserved seat
                  } else if (seats[row][col] == 1) {
                    seatColor = Colors.green; // Selected seat
                  } else {
                    seatColor = Colors.blue; // Available seat
                  }

                  return GestureDetector(
                    onTap: seats[row][col] != -1
                        ? () => toggleSeatSelection(row, col)
                        : null,
                    child: Container(
                      decoration: BoxDecoration(
                        color: seatColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          seats[row][col] == -1 ? 'X' : '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Bookpage4();
                }));
              },
              child: const Text('Book Now'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
