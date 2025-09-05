import 'package:flutter/material.dart';
import 'package:getx_testing/prototypeX/core/utils/app_exceptions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashScreen'),
      ),
      body: Column(
        children: [
          Center(
            child: const Text('Hello, World!'),
          ),
          TextButton(
            onPressed: () {
              throw InternetExceptions("Jimmy");
            },
            child: Text("Throw error"),
          )
        ],
      ),
    );
  }
}
