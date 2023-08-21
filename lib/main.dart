import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/controller/popular_controller.dart';
import 'package:e_commerce/controller/recommended_controller.dart';
import 'package:e_commerce/helper/dependencies.dart';
import 'package:e_commerce/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularController>(builder: (context) {
      return GetBuilder<RecommendedController>(builder: (context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Food Delivery",
          initialRoute: Routes.splash,
          getPages: Routes.route,
        );
      });
    });
  }
}
