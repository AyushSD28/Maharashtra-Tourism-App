import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maharashtra/Home/appbar.dart';
import 'package:maharashtra/Home/navbar.dart';

class FortCleanHome extends StatefulWidget {
  const FortCleanHome({super.key});

  @override
  State<FortCleanHome> createState() => _FortCleanHomeState();
}

class _FortCleanHomeState extends State<FortCleanHome> {
  void showMyBottomSheet(bool lead) {
    if (lead) {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                  top: 10.0,
                  left: 10.0,
                  right: 10.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Register As Guardian",
                        style: GoogleFonts.quicksand(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Name:",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 4, 153, 24)),
                  ),
                  TextField(
                    // controller: titleController,
                    decoration: InputDecoration(
                      hintStyle:
                          const TextStyle(color: Color.fromARGB(108, 0, 0, 0)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Phone No.:",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 4, 153, 24)),
                  ),
                  TextField(
                    // controller: titleController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Email:",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 4, 153, 24)),
                  ),
                  TextField(
                    // controller: titleController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "DOB:",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 4, 153, 24)),
                  ),
                  GestureDetector(
                    child: TextField(
                      // controller: titleController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(2, 167, 177, 1),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(2, 167, 177, 1),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      submitButton();
                      setState(() {});
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 4, 153, 24),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 5,
                              spreadRadius: 1,
                              color: Color.fromARGB(61, 0, 0, 0))
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Sumbit",
                          style: GoogleFonts.quicksand(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          });
    } else {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                  top: 10.0,
                  left: 10.0,
                  right: 10.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Register As Guardian",
                        style: GoogleFonts.quicksand(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Name:",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 4, 153, 24)),
                  ),
                  TextField(
                    // controller: titleController,
                    decoration: InputDecoration(
                      hintStyle:
                          const TextStyle(color: Color.fromARGB(108, 0, 0, 0)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Phone No.:",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 4, 153, 24)),
                  ),
                  TextField(
                    // controller: titleController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "No of People Need:",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 4, 153, 24),
                    ),
                  ),
                  TextField(
                    // controller: titleController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Email:",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 4, 153, 24)),
                  ),
                  TextField(
                    // controller: titleController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Fort:",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 4, 153, 24)),
                  ),
                  TextField(
                    // controller: titleController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(2, 167, 177, 1),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Date of Event:",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 4, 153, 24)),
                  ),
                  GestureDetector(
                    child: TextField(
                      // controller: titleController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(2, 167, 177, 1),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(2, 167, 177, 1),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "DOB:",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 4, 153, 24)),
                  ),
                  GestureDetector(
                    child: TextField(
                      // controller: titleController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(2, 167, 177, 1),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(2, 167, 177, 1),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      submitButton();
                      setState(() {});
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 4, 153, 24),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 5,
                              spreadRadius: 1,
                              color: Color.fromARGB(61, 0, 0, 0))
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Sumbit",
                          style: GoogleFonts.quicksand(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          });
    }
  }

  submitButton() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Appbar(),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Fort Guardians: Join the Clean-Up",
                  style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    // letterSpacing: 3,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Movement",
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showMyBottomSheet(true);
                  setState(() {});
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 5,
                          spreadRadius: 1,
                          color: Color.fromARGB(61, 0, 0, 0))
                    ],
                  ),
                  child: Center(
                    child: Text(
                      " Be the Fort Guardian",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showMyBottomSheet(false);
                  setState(() {});
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 5,
                          spreadRadius: 1,
                          color: Color.fromARGB(61, 0, 0, 0))
                    ],
                  ),
                  child: Center(
                    child: Text(
                      " Be the Leader of Guardian's",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black12),
                            child: Image.asset(
                              "assets/back.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Joshi's Vada...",
                                      style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Shivaji Nagar Pune",
                                      style: GoogleFonts.quicksand(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  "Admin:Prajyot Dhoke",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
// 