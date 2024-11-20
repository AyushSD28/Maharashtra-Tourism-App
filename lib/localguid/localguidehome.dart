import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> upcomingBookings = [
    {
      'id': 1,
      'customer': 'Prajyot',
      'bookingDate': '2024-11-15 10:00 AM',
      'location': 'Beachside Tour',
      'amount': 1000.0,
    },
    {
      'id': 2,
      'customer': 'Mahendra',
      'bookingDate': '2024-11-16 12:00 PM',
      'location': 'Mountain Hiking',
      'amount': 1500.0,
    },
  ];

  final List<Map<String, dynamic>> completedBookings = [
    {
      'id': 1,
      'customer': 'Chetan',
      'bookingDate': '2024-11-10 09:00 AM',
      'location': 'City Tour',
      'amount': 750.0,
    },
  ];

  double get totalRevenue {
    return completedBookings.fold(0, (sum, booking) => sum + booking['amount']);
  }

  String selectedPeriod = 'Weekly';

  void _removeBooking(int id) {
    setState(() {
      upcomingBookings.removeWhere((booking) => booking['id'] == id);
    });
  }

  void _confirmBooking(int id) {
    setState(() {
      final index =
          upcomingBookings.indexWhere((booking) => booking['id'] == id);
      if (index != -1) {
        upcomingBookings[index]['confirmed'] = true;
      }
    });
  }

  void _markAsCompleted(int id) {
    setState(() {
      final index =
          upcomingBookings.indexWhere((booking) => booking['id'] == id);
      if (index != -1) {
        // Move the booking to completedBookings
        completedBookings.add(upcomingBookings[index]);
        // Remove the booking from upcomingBookings
        upcomingBookings.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 59, 58, 58),
      ),
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 59, 58, 58),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Local Guide Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.white54,
              height: 1,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white24)),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white24)),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white24)),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.help_outline,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Help',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white24)),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(fit: StackFit.expand, children: [
        // Image.asset(
        //   "assets/backgrounds/congrats.jpeg",
        //   fit: BoxFit.cover,
        // ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 240, 236, 236)),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _revenueSection(),
                const SizedBox(height: 20),
                // _revenueGraphSection(),
                // const SizedBox(height: 20),
                _upcomingBookingsSection(context),
                const SizedBox(height: 20),
                _completedBookingsSection(),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _revenueSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Revenue',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 5),
              Text(
                '₹${totalRevenue.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ],
          ),
          const Icon(
            Icons.bar_chart,
            color: Colors.black,
            size: 40,
          ),
        ],
      ),
    );
  }

  // Widget _revenueGraphSection() {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: const Color.fromARGB(255, 220, 219, 219),
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.2),
  //           spreadRadius: 2,
  //           blurRadius: 8,
  //           offset: const Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             const Text(
  //               'Total Revenue',
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //             ),
  //             Text(
  //               '₹${totalRevenue.toStringAsFixed(2)}',
  //               style: const TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.green),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 10),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             const Text(
  //               'Revenue Graph',
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //             ),
  //             DropdownButton<String>(
  //               value: selectedPeriod,
  //               items:
  //                   <String>['Weekly', 'Monthly', 'Yearly'].map((String value) {
  //                 return DropdownMenuItem<String>(
  //                   value: value,
  //                   child: Text(value),
  //                 );
  //               }).toList(),
  //               onChanged: (value) {
  //                 setState(() {
  //                   selectedPeriod = value!;
  //                 });
  //               },
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 10),
  //         SizedBox(
  //           height: 200,
  //           child: LineChart(LineChartData(
  //             borderData: FlBorderData(show: false),
  //             lineBarsData: [
  //               LineChartBarData(
  //                 spots: [
  //                   const FlSpot(1, 100),
  //                   const FlSpot(2, 150),
  //                   const FlSpot(3, 200),
  //                   const FlSpot(4, 250),
  //                   const FlSpot(5, 300),
  //                   const FlSpot(6, 400),
  //                   const FlSpot(7, 500),
  //                 ],
  //                 isCurved: true,
  //                 color: Colors.grey,
  //                 dotData: const FlDotData(show: false),
  //               ),
  //             ],
  //           )),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _upcomingBookingsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(245, 245, 245, 1).withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Upcoming Bookings',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              IconButton(
                icon: const Icon(Icons.filter_list, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListView.builder(
            itemCount: upcomingBookings.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final booking = upcomingBookings[index];
              return _bookingItem(booking, context, true);
            },
          ),
        ],
      ),
    );
  }

  Widget _completedBookingsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Completed Bookings',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            itemCount: completedBookings.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final booking = completedBookings[index];
              return _bookingItem(booking, context, false);
            },
          ),
        ],
      ),
    );
  }

  Widget _bookingItem(
      Map<String, dynamic> booking, BuildContext context, bool isUpcoming) {
    bool isConfirmed = booking['confirmed'] ?? false;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(booking['customer'],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  const SizedBox(height: 5),
                  Text(booking['location'],
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 117, 117, 117))),
                  const SizedBox(height: 5),
                  Text('Date: ${booking['bookingDate']}',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 117, 117, 117))),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('₹${booking['amount']}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                  if (!isConfirmed) const SizedBox(height: 10),
                  if (!isConfirmed && isUpcoming)
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              // Confirm the booking
                              _confirmBooking(booking['id']);
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 30,
                              ),
                            )),
                        const SizedBox(width: 10),
                        GestureDetector(
                            onTap: () {
                              // Remove the booking
                              _removeBooking(booking['id']);
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 30,
                              ),
                            )),
                      ],
                    ),
                  if (isConfirmed && isUpcoming)
                    const Text(
                      'Confirmed',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                ],
              ),
            ],
          ),
          // Show the "Mark as Completed" button for upcoming bookings only
          if (isUpcoming && isConfirmed)
            GestureDetector(
              onTap: () {
                _markAsCompleted(booking['id']);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Center(
                  child: Container(
                    height: 35,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      'Mark as Completed',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
