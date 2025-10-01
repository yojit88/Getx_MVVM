import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_testing/prototypeX/core/values/values.dart';
import '../dashboard_screen_controller.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final DashboardScreenController dashboardScreenController = Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: CircleAvatar(
                      radius: index % 2 == 0 ? 20.00.rs : 20.00,
                      child: Text(
                        "Y",
                        style: TextStyle(
                          fontSize: index % 2 == 0 ? 20.00.rs : 20.00,
                        ),
                      ),
                    ),
                    title: Text(
                      index % 2 == 0 ? "Custom" : "Package",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: index % 2 == 0 ? AppSizes.dimenToPx16.rs : 16.00),
                    ),
                    subtitle: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.......... Read More",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: index % 2 == 0 ? 15.00.rs : 15.00),
                    ),
                  ),
                  Divider()
                ],
              ),
            );
          },
        )),
      ],
    );
  }
}
