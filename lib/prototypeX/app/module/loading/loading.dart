import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingService extends GetxService {
  BuildContext? _context;

  void loading(BuildContext context, bool loading, {String? text}) {
    if (loading) {
      _context = context;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return PopScope(
            canPop: false,
            child: LoadingBar(
              text: text,
            ),
          );
        },
      );
    } else {
      if (_context != null) {
        Navigator.of(_context!).pop(); // Pop the dialog
        _context = null;
      }
    }
  }
}

// This is the Loading animation dialog
class LoadingBar extends StatelessWidget {
  const LoadingBar({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    // A container with a teal background color and a circular loading animation
    return Center(
      child: Column(
        children: [
          Container(
            color: Colors.teal.shade700,
            child: const CircularProgressIndicator(), // Display the circular loading animation
          ),
          Text(text ?? "Loading...")
        ],
      ),
    );
  }
}
