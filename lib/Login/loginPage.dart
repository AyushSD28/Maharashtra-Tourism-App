import 'dart:developer';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maharashtra/Home/homepage.dart';
import 'package:maharashtra/Login/signupPage.dart';
import 'package:maharashtra/snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/backgrounds/loginimg3.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 24.0),
                margin: const EdgeInsets.symmetric(horizontal: 32.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Welcome to Maharashtra!',
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 216, 67, 21),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Discover the beauty of Maharashtra – from beaches to hill stations.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromRGBO(37, 35, 34, 1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        labelText: 'Username',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        prefixIcon: const Icon(Icons.person,
                            color: Color.fromRGBO(109, 76, 65, 1)),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: _showPassword,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          prefixIcon: const Icon(Icons.lock,
                              color: Color.fromRGBO(109, 76, 65, 1)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _showPassword = !_showPassword;
                              setState(() {});
                            },
                            child: Icon(
                              (_showPassword)
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color.fromRGBO(37, 35, 34, 1),
                            ),
                          )),
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_emailController.text.trim().isNotEmpty &&
                            _passwordController.text.trim().isNotEmpty) {
                          try {
                            UserCredential userCredential =
                                await _firebaseAuth.signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            log("Maharashtra Tourism: UserCredentials: ${userCredential.user!.email}");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          } on FirebaseAuthException catch (error) {
                            log("Maharashtra Tourism: ERROR: ${error.code}");
                            log("Maharashtra Tourism: ERROR: ${error.message}");
                            CustomSnackbar.showCustomSnackbar(
                                message: error.code, context: context);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(230, 74, 25, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      child: const Text(
                        'Don\'t have an account? Sign up',
                        style: TextStyle(
                          color: Color.fromRGBO(216, 67, 21, 1),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
