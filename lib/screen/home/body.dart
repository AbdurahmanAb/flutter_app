import 'package:e_commerce/screen/home/MainPage.dart';

import 'package:e_commerce/utils/Dimensions.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/widgets/headers.dart';
import 'package:e_commerce/widgets/subtitle.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: Dimensions.height45, bottom: Dimensions.height15),
          padding: EdgeInsets.only(
              left: Dimensions.width20, right: Dimensions.width20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Header(
                    text: "Abdurahman A",
                    color: AppColors.mainColor,
                  ),
                  Row(
                    children: [
                      Subtitle(text: "Ethiopia"),
                      Icon(Icons.arrow_drop_down_rounded)
                    ],
                  )
                ],
              ),
              Container(
                height: Dimensions.height45,
                width: Dimensions.height45,
                child: Center(
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: Dimensions.Icon24,
                  ),
                ),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                ),
              )
            ],
          ),
        ),
        Expanded(child: SingleChildScrollView(child: MainPage())),
      ],
    ));
  }
}
