import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:maharashtra/Model%20classes/guidemodel.dart';
import 'package:maharashtra/localguid/bookingpage.dart';

class LocalGuideForm extends StatefulWidget {
  const LocalGuideForm({super.key});

  @override
  State<LocalGuideForm> createState() => _LocalGuideFormState();
}

class _LocalGuideFormState extends State<LocalGuideForm> {
  List<GuideModel> guideList = [];

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController expertiseController = TextEditingController();

  final PageController _pageController = PageController();
  int _currentPage = 0;

  String? gender;

  String? contactNumber;
  List<String> languages = [];
  List<String> tourTypes = [];
  String? yearsOfExperience;

  void updateLanguages(String language, bool isSelected) {
    setState(() {
      if (isSelected) {
        languages.add(language);
      } else {
        languages.remove(language);
      }
    });
  }

  void updateTourTypes(String tourType, bool isSelected) {
    setState(() {
      if (isSelected) {
        tourTypes.add(tourType);
      } else {
        tourTypes.remove(tourType);
      }
    });
  }

  bool hasCertifications = false;

  String? preferredWorkingHours;
  String? daysAvailableForTours;
  List<String> seasonalAvailability = [];

  void updateSeasonalAvailability(String season, bool isSelected) {
    if (isSelected) {
      seasonalAvailability.add(season);
    } else {
      seasonalAvailability.remove(season);
    }
  }

  String? _filePath;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String? filePath = result.files.single.path;

      setState(() {
        _filePath = filePath;
      });
    } else {
      print("User canceled file picker");
    }
  }

  List<Map<String, dynamic>> submissions = [];

  void submitForm() {
    setState(() {
      submissions.add({
        'profilePhoto': _filePath != null ? File(_filePath!) : null,
        'name': nameController.text,
        'contactNumber': contactController.text,
        'yearsOfExperience': yearsOfExperience,
        'languages': languages,
      });
    });

    nameController.clear();
    contactController.clear();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubmissionsPage(submissions: submissions),
      ),
    );
  }

  void addGuideData({required String? filePath}) async {
    print("Uploading Local Guide Data to Cloud");

    // Create the guide data map
    Map<String, dynamic> guideData = {
      'name': nameController.text,
      'dateOfBirth': dateController.text,
      'gender': gender,
      'contactNumber': contactController.text,
      'emailAddress': emailController.text,
      'address': addressController.text,
      'yearsOfExperience': yearsOfExperience,
      'languages': languages,
      'tourTypes': tourTypes,
      'areasOfExpertise': expertiseController.text,
      'availability': {
        'preferredWorkingHours': preferredWorkingHours,
        'daysAvailableForTours': daysAvailableForTours,
        'seasonalAvailability': seasonalAvailability,
      },
      'profilePhoto': filePath,
    };

    try {
      // Add data to Firestore
      await FirebaseFirestore.instance.collection("Local Guide").add(guideData);

      nameController.clear();
      dateController.clear();
      gender = '';
      contactController.clear();
      emailController.clear();
      addressController.clear();
      yearsOfExperience = '';
      languages = '' as List<String>;
      tourTypes = '' as List<String>;
      preferredWorkingHours = '';
      daysAvailableForTours = '';
      seasonalAvailability = '' as List<String>;
      expertiseController.clear();
      filePath = Null;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Submitted Successfully!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  Future<void> getGuideData() async {
    guideList.clear();

    try {
      // Retrieve data from Firestore
      QuerySnapshot response =
          await FirebaseFirestore.instance.collection("Local Guide").get();

      for (var value in response.docs) {
        print("Value:${value['name']}");
        guideList.add(GuideModel(
          name: value['name'],
          dateOfBirth: value['dateOfBirth'],
          gender: value['gender'],
          contactNumber: value['contactNumber'],
          emailAddress: value['emailAddress'],
          address: value['address'],
          yearsOfExperience: value['yearsOfExperience'],
          languages: [value[languages]],
          tourTypes: [value[tourTypes]],
          areasOfExpertise: value['areasOfExpertise'],
          preferredWorkingHours: value['preferredWorkingHours'],
          daysAvailableForTours: value['daysAvailableForTours'],
          seasonalAvailability: [],
        ));
      }
    } catch (e) {
      print("Error fetching guide data: $e");
    }
  }

  // void initState() {
  //   super.initState();
  //   _fetchSubmissions();
  // }

  // // Fetch submissions from Firestore
  // Future<void> _fetchSubmissions() async {
  //   try {
  //     QuerySnapshot snapshot =
  //         await FirebaseFirestore.instance.collection("Local Guide").get();

  //     List<Map<String, dynamic>> fetchedSubmissions = [];
  //     for (var doc in snapshot.docs) {
  //       fetchedSubmissions.add(doc.data() as Map<String, dynamic>);
  //     }

  //     setState(() {
  //       submissions = fetchedSubmissions;
  //     });
  //   } catch (e) {
  //     print("Error fetching submissions: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text(
      //     "Maharashtra Tourism",
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(187, 192, 189, 1),
                Color.fromRGBO(84, 85, 86, 1)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Text(
                    "Local Guide Aplication Form",
                    style:
                        GoogleFonts.raleway(color: Colors.white, fontSize: 22),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 530,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white54),
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      children: [
                        // Section 1
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  "Section 1: Personal Information",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                const Divider(
                                  thickness: 4,
                                ),
                                const SizedBox(height: 10),
                                // Full Name
                                TextField(
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                      labelText: "Full Name",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1.0))),
                                ),
                                const SizedBox(height: 10),
                                // Date of Birth
                                TextField(
                                  controller: dateController,
                                  decoration: const InputDecoration(
                                      suffixIcon: Icon(
                                          Icons.calendar_month_outlined,
                                          color: Color.fromRGBO(0, 0, 0, 0.7)),
                                      labelText: 'Date of Birth',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1.0))),
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2024));

                                    String formattedDate =
                                        DateFormat.yMMMd().format(pickedDate!);

                                    setState(() {
                                      dateController.text = formattedDate;
                                    });
                                  },
                                ),
                                const SizedBox(height: 10),
                                // Gender
                                const Text("Gender:"),
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Male',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value!;
                                        });
                                      },
                                    ),
                                    const Text("Male"),
                                    Radio<String>(
                                      value: 'Female',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value!;
                                        });
                                      },
                                    ),
                                    const Text("Female"),
                                    Radio<String>(
                                      value: 'Other',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value!;
                                        });
                                      },
                                    ),
                                    const Text("Other"),
                                  ],
                                ),
                                // Contact Number
                                TextField(
                                  controller: contactController,
                                  decoration: const InputDecoration(
                                      labelText: "Contact Number",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1.0))),
                                ),
                                const SizedBox(height: 10),
                                // Email Address
                                TextField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                      labelText: "Email Address",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1.0))),
                                ),
                                const SizedBox(height: 10),
                                // Permanent Address
                                TextField(
                                  controller: addressController,
                                  decoration: const InputDecoration(
                                      labelText: "Permanent Address",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1.0))),
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Section 2
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Center(
                                  child: Text(
                                    "Section 2: Professional Details",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                const Divider(
                                  thickness: 4,
                                ),
                                // 1. Years of Experience as a Guide
                                const Text(
                                  "Years of Experience as a Guide:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                Column(
                                  children: [
                                    RadioListTile<String>(
                                      title: const Text("0-2 years"),
                                      value: "0-2 years",
                                      groupValue: yearsOfExperience,
                                      onChanged: (value) {
                                        setState(() {
                                          yearsOfExperience = value!;
                                        });
                                      },
                                    ),
                                    RadioListTile<String>(
                                      title: const Text("2-5 years"),
                                      value: "2-5 years",
                                      groupValue: yearsOfExperience,
                                      onChanged: (value) {
                                        setState(() {
                                          yearsOfExperience = value!;
                                        });
                                      },
                                    ),
                                    RadioListTile<String>(
                                      title: const Text("5-10 years"),
                                      value: "5-10 years",
                                      groupValue: yearsOfExperience,
                                      onChanged: (value) {
                                        setState(() {
                                          yearsOfExperience = value!;
                                        });
                                      },
                                    ),
                                    RadioListTile<String>(
                                      title: const Text("10+ years"),
                                      value: "10+ years",
                                      groupValue: yearsOfExperience,
                                      onChanged: (value) {
                                        setState(() {
                                          yearsOfExperience = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const Divider(),
                                // 2. Languages Spoken (Select all that apply)
                                const Text(
                                  "Languages Spoken (Select all that apply):",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                Column(
                                  children: [
                                    CheckboxListTile(
                                      title: const Text("English"),
                                      value: languages.contains("English"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateLanguages("English", value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text("Spanish"),
                                      value: languages.contains("Spanish"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateLanguages("Spanish", value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text("French"),
                                      value: languages.contains("French"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateLanguages("French", value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text("German"),
                                      value: languages.contains("German"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateLanguages("German", value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text("Mandarin"),
                                      value: languages.contains("Mandarin"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateLanguages("Mandarin", value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text(
                                          "Other(s) (Please specify):"),
                                      value: languages.contains("Other"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateLanguages("Other", value!);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const Divider(),
                                // 3. Type of Tours Specialized In
                                const Text(
                                  "Type of Tours Specialized In:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                Column(
                                  children: [
                                    CheckboxListTile(
                                      title: const Text("Cultural Tours"),
                                      value:
                                          tourTypes.contains("Cultural Tours"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateTourTypes(
                                              "Cultural Tours", value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text("Historical Sites"),
                                      value: tourTypes
                                          .contains("Historical Sites"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateTourTypes(
                                              "Historical Sites", value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text(
                                          "Adventure and Nature Tours"),
                                      value: tourTypes.contains(
                                          "Adventure and Nature Tours"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateTourTypes(
                                              "Adventure and Nature Tours",
                                              value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text("City Tours"),
                                      value: tourTypes.contains("City Tours"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateTourTypes("City Tours", value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title:
                                          const Text("Wildlife and Eco Tours"),
                                      value: tourTypes
                                          .contains("Wildlife and Eco Tours"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateTourTypes(
                                              "Wildlife and Eco Tours", value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title:
                                          const Text("Culinary and Wine Tours"),
                                      value: tourTypes
                                          .contains("Culinary and Wine Tours"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateTourTypes(
                                              "Culinary and Wine Tours",
                                              value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text("Other(s):"),
                                      value: tourTypes.contains("Other"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateTourTypes("Other", value!);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const Divider(),
                                // 4. Areas of Local Expertise
                                const Text(
                                  "Areas of Local Expertise (List specific places or regions):",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                TextField(
                                  controller: expertiseController,
                                  decoration: const InputDecoration(
                                      labelText: "Areas of Expertise",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1.0))),
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Section 3
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Center(
                                  child: Text(
                                    "Section 3: Availability",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                const Divider(
                                  thickness: 4,
                                ),
                                const Text(
                                  "Preferred Working Hours:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                Column(
                                  children: [
                                    RadioListTile<String>(
                                      title: const Text("Full Day"),
                                      value: "Full Day",
                                      groupValue: preferredWorkingHours,
                                      onChanged: (value) {
                                        setState(() {
                                          preferredWorkingHours = value!;
                                        });
                                      },
                                    ),
                                    RadioListTile<String>(
                                      title: const Text("Half Day"),
                                      value: "Half Day",
                                      groupValue: preferredWorkingHours,
                                      onChanged: (value) {
                                        setState(() {
                                          preferredWorkingHours = value!;
                                        });
                                      },
                                    ),
                                    RadioListTile<String>(
                                      title: const Text("Evenings"),
                                      value: "Evenings",
                                      groupValue: preferredWorkingHours,
                                      onChanged: (value) {
                                        setState(() {
                                          preferredWorkingHours = value!;
                                        });
                                      },
                                    ),
                                    RadioListTile<String>(
                                      title: const Text("Flexible"),
                                      value: "Flexible",
                                      groupValue: preferredWorkingHours,
                                      onChanged: (value) {
                                        setState(() {
                                          preferredWorkingHours = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const Divider(),
                                const Text(
                                  "Days Available for Tours:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                Column(
                                  children: [
                                    RadioListTile<String>(
                                      title: const Text("Weekdays Only"),
                                      value: "Weekdays Only",
                                      groupValue: daysAvailableForTours,
                                      onChanged: (value) {
                                        setState(() {
                                          daysAvailableForTours = value!;
                                        });
                                      },
                                    ),
                                    RadioListTile<String>(
                                      title: const Text("Weekends Only"),
                                      value: "Weekends Only",
                                      groupValue: daysAvailableForTours,
                                      onChanged: (value) {
                                        setState(() {
                                          daysAvailableForTours = value!;
                                        });
                                      },
                                    ),
                                    RadioListTile<String>(
                                      title: const Text("Both"),
                                      value: "Both",
                                      groupValue: daysAvailableForTours,
                                      onChanged: (value) {
                                        setState(() {
                                          daysAvailableForTours = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const Divider(),
                                const Text(
                                  "Seasonal Availability (Mark if available):",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                Column(
                                  children: [
                                    CheckboxListTile(
                                      title: const Text("Summer"),
                                      value: seasonalAvailability
                                          .contains("Summer"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateSeasonalAvailability(
                                              "Summer", value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text("Winter"),
                                      value: seasonalAvailability
                                          .contains("Winter"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateSeasonalAvailability(
                                              "Winter", value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text("Spring"),
                                      value: seasonalAvailability
                                          .contains("Spring"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateSeasonalAvailability(
                                              "Spring", value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text("Autumn"),
                                      value: seasonalAvailability
                                          .contains("Autumn"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateSeasonalAvailability(
                                              "Autumn", value!);
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text("All Year"),
                                      value: seasonalAvailability
                                          .contains("All Year"),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          updateSeasonalAvailability(
                                              "All Year", value!);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text(
                                      "Choose an image for your display profile",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(height: 10),
                                    Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                        onPressed: pickFile,
                                        child: const Text(
                                          "Pick a File",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    _filePath != null
                                        ? Text("Selected file: $_filePath")
                                        : const Text("No file selected"),
                                  ],
                                ),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      final submission = {
                                        'name': nameController.text,
                                        'contactNumber': contactController.text,
                                        'yearsOfExperience': yearsOfExperience,
                                        'languages': languages,
                                        'tourTypes': tourTypes,
                                        'availability': {
                                          'preferredWorkingHours':
                                              preferredWorkingHours,
                                          'daysAvailableForTours':
                                              daysAvailableForTours,
                                          'seasonalAvailability':
                                              seasonalAvailability,
                                        },
                                        'profilePhoto': _filePath != null
                                            ? File(_filePath!)
                                            : null,
                                        'address': addressController.text,
                                      };
                                      submissions.add(submission);

                                      if (nameController.text
                                          .trim()
                                          .isNotEmpty) {
                                        addGuideData(filePath: _filePath);

                                        await getGuideData();
                                        setState(() {});
                                      }

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SubmissionsPage(
                                              submissions: submissions),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    child: const Text("Submit",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _currentPage == i ? Colors.white : Colors.grey,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Stack(
      //   clipBehavior: Clip.none,
      //   children: [
      //     Container(
      //       height: 70,
      //       color: Colors.black,
      //       child: Padding(
      //         padding: const EdgeInsets.only(top: 10.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             Column(
      //               children: [
      //                 Image.asset(
      //                   "assets/rareFacts.png",
      //                   color: Colors.white,
      //                   scale: 17,
      //                 ),
      //                 Text(
      //                   "Facts",
      //                   style: GoogleFonts.quicksand(
      //                     color: Colors.white,
      //                     fontSize: 13,
      //                     fontWeight: FontWeight.w700,
      //                   ),
      //                 )
      //                 // Text(
      //                 //   // Text 2
      //                 //   "Facts",
      //                 //   style: GoogleFonts.quicksand(
      //                 //     color: Colors.white,
      //                 //     fontSize: 13,
      //                 //     fontWeight: FontWeight.w700,
      //                 //   ),
      //                 // ),
      //               ],
      //             ),
      //             Column(
      //               children: [
      //                 Image.asset(
      //                   "assets/fivestarsHotels.png",
      //                   color: Colors.white,
      //                   scale: 17,
      //                 ),
      //                 Text(
      //                   "Hotels",
      //                   style: GoogleFonts.quicksand(
      //                       fontSize: 13,
      //                       fontWeight: FontWeight.w700,
      //                       color: Colors.white),
      //                 )
      //               ],
      //             ),
      //             // Placeholder for spacing the central Home button
      //             const SizedBox(width: 50),
      //             Column(
      //               children: [
      //                 Image.asset(
      //                   "assets/trekBook.png",
      //                   color: Colors.white,
      //                   scale: 17,
      //                 ),
      //                 Text(
      //                   "Treks",
      //                   style: GoogleFonts.quicksand(
      //                       fontSize: 13,
      //                       fontWeight: FontWeight.w700,
      //                       color: Colors.white),
      //                 )
      //               ],
      //             ),
      //             Column(
      //               children: [
      //                 Image.asset(
      //                   "assets/marathishow.png",
      //                   color: Colors.white,
      //                   scale: 17,
      //                 ),
      //                 Text(
      //                   "Shows",
      //                   style: GoogleFonts.quicksand(
      //                       fontSize: 13,
      //                       fontWeight: FontWeight.w700,
      //                       color: Colors.white),
      //                 )
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     // Positioned Home button for the elevated look
      //     Positioned(
      //       top: -30, // Adjust this value to control overlap
      //       left: MediaQuery.of(context).size.width / 2 - 25, // Center align
      //       child: Column(
      //         children: [
      //           Container(
      //             height: 70,
      //             width: 70,
      //             decoration: BoxDecoration(
      //               shape: BoxShape.circle,
      //               color: Colors.white, // Button background color
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.black.withOpacity(0.3),
      //                   spreadRadius: 5,
      //                   blurRadius: 10,
      //                   offset: const Offset(0, 3), // Shadow position
      //                 ),
      //               ],
      //             ),
      //             child: Image.asset(
      //               "assets/home.png",
      //               color: Colors.black,
      //               scale: 10,
      //             ),
      //           ),
      //           Text(
      //             "Home",
      //             style: GoogleFonts.quicksand(
      //                 fontSize: 13,
      //                 fontWeight: FontWeight.w700,
      //                 color: Colors.white),
      //           )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class SubmissionsPage extends StatelessWidget {
  final List<Map<String, dynamic>> submissions;

  const SubmissionsPage({super.key, required this.submissions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Submitted Applications",
        ),
        backgroundColor: const Color.fromARGB(255, 229, 224, 224),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: submissions.length,
          itemBuilder: (context, index) {
            final submission = submissions[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: GestureDetector(
                onTap: () {
                  _showSubmissionDetails(context, submission);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.black12, Colors.black26],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: submission['profilePhoto'] != null
                                ? FileImage(submission['profilePhoto'])
                                : const AssetImage("assets/placeholder.png")
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              submission['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Contact: ${submission['contactNumber']}",
                              style: const TextStyle(color: Colors.white70),
                            ),
                            Text(
                              "Experience: ${submission['yearsOfExperience']}",
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios,
                          color: Colors.white70),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSubmissionDetails(
      BuildContext context, Map<String, dynamic> submission) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: submission['profilePhoto'] != null
                            ? FileImage(submission['profilePhoto'])
                            : const AssetImage("assets/placeholder.png")
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    submission['name'] ?? 'No Name',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.phone, color: Colors.black, size: 24),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Contact",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            submission['contactNumber'] ?? 'No Contact',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.home, color: Colors.black, size: 24),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            submission['address'] ?? 'No Address',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.work, color: Colors.black, size: 24),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Experience",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            submission['yearsOfExperience'] ?? 'No Experience',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.language, color: Colors.black, size: 24),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Languages",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            submission['languages'] != null
                                ? submission['languages'].join(', ')
                                : 'Not Specified',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.tour, color: Colors.black, size: 24),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tour Types",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            submission['tourTypes'] != null
                                ? submission['tourTypes'].join(', ')
                                : 'Not Specified',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 16),
                const Text(
                  "Availability",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.schedule, color: Colors.black, size: 24),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Working Hours",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            submission['availability']
                                    ?['preferredWorkingHours'] ??
                                'Not Specified',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.calendar_today,
                        color: Colors.black, size: 24),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Days Available",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            submission['availability']
                                    ?['daysAvailableForTours'] ??
                                'Not Specified',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.wb_sunny, color: Colors.black, size: 24),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Seasons Available",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            submission['availability']
                                        ?['seasonalAvailability'] !=
                                    null
                                ? submission['availability']
                                        ['seasonalAvailability']
                                    .join(', ')
                                : 'Not Specified',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BookingPage(localGuide: submission),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text(
                      "Book Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
