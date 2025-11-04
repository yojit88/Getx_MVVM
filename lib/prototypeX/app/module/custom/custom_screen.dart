import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/prototypeX/core/values/values.dart';

class CustomSizeScreen extends StatelessWidget {
  const CustomSizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing"),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(AppRoutes.signUpScreen);
            },
            child: Text("Testing Screen"),
          )
        ],
      ),
      body: Padding(
        // keep using your ratio-based extension (e.g., .rs)
        padding: EdgeInsets.all(16.00),
        child: Column(
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
                            radius: index % 2 == 0 ? 20.00 : 20.00,
                            child: Text(
                              "Y",
                              style: TextStyle(
                                fontSize: index % 2 == 0 ? 20.00 : 20.00,
                              ),
                            ),
                          ),
                          title: Text(
                            index % 2 == 0 ? "Custom" : "Package",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: index % 2 == 0 ? 16.00.rs : 16.00.crs(customWidth: 900, customHeight: 1500)),
                          ),
                          subtitle: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.......... Read More",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: index % 2 == 0 ? 15.00 : 15.00),
                          ),
                        ),
                        Divider()
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
