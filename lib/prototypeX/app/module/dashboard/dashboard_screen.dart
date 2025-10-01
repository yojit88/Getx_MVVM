import 'package:flutter/material.dart';
import 'package:getx_testing/prototypeX/app/module/dashboard/dashboard_screen_controller.dart';
import 'widget/dashboard_view.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardScreen'),
      ),
      body: DashboardView(),
    );
  }
}
