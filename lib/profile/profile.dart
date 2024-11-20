import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({super.key});

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  double _width2 = 0;
  double _width1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // shadowColor: Colors.amber,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            "assets/left-arrow.png",
            scale: 20,
            // color: Colors.white54,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Prajyot",
          style: GoogleFonts.oldStandardTt(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/my.jpg",
                      // color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {
                        //imagePicker
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white)),
                    child: Center(
                      child: Text(
                        "Edit Detail's",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white)),
                    child: Center(
                      child: Text(
                        "Edit",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  "Highlight's:",
                  style: GoogleFonts.oldStandardTt(
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Image.asset("assets/my.jpg"),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GestureDetector(
                        onTap: () => setState(() {
                              _width1 = 120;
                              _width2 = 0;
                            }),
                        child: Text(
                          "My Booking's",
                          style: GoogleFonts.oldStandardTt(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 5,
                      width: _width1,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 7,
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () => setState(() {
                              _width2 = 120;
                              _width1 = 0;
                            }),
                        child: Text(
                          "Downloads",
                          style: GoogleFonts.oldStandardTt(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 5,
                      width: _width2,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 5,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
