import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.startTimer();
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.task_alt,
                  size: 35,
                  color: Colors.deepPurple,
                ),
                Text(
                  'Daily Routine',
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
            SizedBox(height: 30),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
