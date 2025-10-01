import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_testing/prototypeX/app/routes/routes.dart';
import 'package:getx_testing/prototypeX/core/theme/app_color.dart';
import 'package:getx_testing/prototypeX/core/values/app_routes_name.dart';
import 'package:getx_testing/prototypeX/core/values/app_strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GetMaterialApp(
        title: 'Getx Testing',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: Colors.white).copyWith(
          extensions: [
            AppColors.light(),
          ],
        ),
        initialRoute: AppRoutes.splashScreen,
        getPages: AppPages.routes,
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        translations: Language(),
      ),
    );
  }
}
