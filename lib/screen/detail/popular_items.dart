import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/controller/popular_controller.dart';
import 'package:e_commerce/routes/route.dart';
import 'package:e_commerce/utils/Dimensions.dart';
import 'package:e_commerce/utils/appConstants.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/widgets/app_desc_column.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:e_commerce/widgets/expanded_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/headers.dart';

class Popular extends StatelessWidget {
  final int pageId;
  const Popular({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var products = Get.find<PopularController>().popularList[pageId];
    Get.find<PopularController>()
        .initItem(products, Get.find<CartController>());

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: Dimensions.popularImgHeight,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          AppConstants.BASE_URL +
                              AppConstants.path +
                              products.img,
                        ))),
              )),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.getInital());
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  GetBuilder<PopularController>(builder: (controller) {
                    return Stack(
                      children: [
                        const AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularController>().totalItems >= 1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: AppIcon(
                                  icon: Icons.circle,
                                  backgroundColor: AppColors.mainColor,
                                  iconColor: Colors.transparent,
                                  size: 20,
                                ))
                            : Container(),
                        Get.find<PopularController>().totalItems >= 1
                            ? Positioned(
                                right: 3,
                                top: 3,
                                child: Header(
                                  text: Get.find<PopularController>()
                                      .totalItems
                                      .toString(),
                                  size: 12,
                                  color: Colors.white,
                                ))
                            : Container()
                      ],
                    );
                  })
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularImgHeight - 25,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppDescCol(
                      text: products.name,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Header(
                      text: "Introduce",
                      size: Dimensions.height25,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            child: ExpandedText(text: products.description)))
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularController>(builder: (PopularController) {
        return Container(
          height: Dimensions.height70,
          margin: EdgeInsets.only(bottom: Dimensions.height10),
          padding: EdgeInsets.only(
              top: Dimensions.height10,
              left: Dimensions.width20,
              right: Dimensions.width20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white),
                child: Row(children: [
                  GestureDetector(
                      onTap: () {
                        PopularController.setQuantity(false);
                      },
                      child: Icon(
                        Icons.remove,
                        size: Dimensions.Icon24,
                      )),
                  SizedBox(
                    width: Dimensions.width15 / 2,
                  ),
                  Header(text: PopularController.totalItems.toString()),
                  SizedBox(
                    width: Dimensions.width15 / 2,
                  ),
                  GestureDetector(
                      onTap: () {
                        PopularController.setQuantity(true);
                      },
                      child: Icon(
                        Icons.add,
                        size: Dimensions.Icon24,
                      ))
                ]),
              ),
              GestureDetector(
                onTap: () {
                  PopularController.addItem(products);
                },
                child: Container(
                  child: Header(
                    text: " \$ ${products.price} |  Add To Cart ",
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
