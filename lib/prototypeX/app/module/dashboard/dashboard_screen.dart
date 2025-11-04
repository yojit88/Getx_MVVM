import 'package:flutter/material.dart';
import 'package:getx_testing/prototypeX/app/module/dashboard/dashboard_screen_controller.dart';
import 'package:getx_testing/prototypeX/core/values/app_routes_name.dart';
import 'widget/dashboard_view.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardScreenController dashboardScreenController = Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardScreen'),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(AppRoutes.testingScreen);
            },
            child: Text("Testing Screen"),
          )
        ],
      ),
      body: DashboardView(),
    );
  }
}
