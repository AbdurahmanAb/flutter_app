import 'package:e_commerce/controller/popular_controller.dart';
import 'package:e_commerce/controller/recommended_controller.dart';
import 'package:e_commerce/helper/dependencies.dart';
import 'package:e_commerce/routes/route.dart';

import 'package:e_commerce/screen/home/body.dart';
import 'package:e_commerce/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularController>().getPopularList();
    Get.find<RecommendedController>().getRecommendedList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      initialRoute: Routes.initial,
      getPages: Routes.route,
    );
  }
}
