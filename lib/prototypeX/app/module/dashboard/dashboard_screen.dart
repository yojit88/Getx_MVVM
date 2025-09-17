import 'package:flutter/material.dart';
import 'widget/dashboard_view.dart';

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
