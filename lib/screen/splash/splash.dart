import 'package:e_commerce/routes/route.dart';
import 'package:e_commerce/utils/Dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/popular_controller.dart';
import '../../controller/recommended_controller.dart';
import '../home/body.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  void _loader() {
    Get.find<PopularController>().getPopularList();
    Get.find<RecommendedController>().getRecommendedList();
  }

  void initState() {

    _loader();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward(); //start the animation
    /**
           * .. Calling a method from instance of the class at the same time
           * 
           */
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(const Duration(seconds: 3), () {
      Get.offNamed(Routes.initial);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ScaleTransition(
          scale: animation,
          child: Center(
            child: Image.asset(
              "assets/images/logo part 1.png",
              width: Dimensions.width300,
            ),
          ),
        ),
        Center(
          child: Image.asset(
            "assets/images/logo part 2.png",
            width: Dimensions.width300,
          ),
        ),
      ]),
    );
  }
}
