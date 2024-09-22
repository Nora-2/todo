import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/view/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Timer(const Duration(seconds: 2), () {
      Get.offAll(const HomeScreen()); // Navigate to home screen
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Image.asset('assets/3327597.jpg', width: 250,height: 250,), // Replace with your logo
            const SizedBox(height: 20),
            // App Name
           const Text(
              'Let’s manage our days...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}




