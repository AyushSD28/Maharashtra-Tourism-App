import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maharashtra/Starting/page1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAc2HNFBFefsrVXU91-KIrlUD5Bgu8u-WI",
          appId: "1:430246812110:android:f56dd83a66873c69e1339f",
          messagingSenderId: "430246812110",
          projectId: "tourismapp-341dc"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page1(),
    );
  }
}
