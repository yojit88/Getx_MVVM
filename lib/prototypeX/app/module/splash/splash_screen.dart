import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashScreenController splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashScreen'),
      ),
      body: Column(
        children: [
          Center(
            child: const Text('Splash Screen'),
          ),
        ],
      ),
    );
  }
}
