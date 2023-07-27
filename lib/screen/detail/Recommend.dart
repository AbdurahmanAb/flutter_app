import 'package:e_commerce/controller/popular_controller.dart';
import 'package:e_commerce/controller/recommended_controller.dart';
import 'package:e_commerce/routes/route.dart';
import 'package:e_commerce/utils/Dimensions.dart';
import 'package:e_commerce/utils/appConstants.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:e_commerce/widgets/expanded_text.dart';
import 'package:e_commerce/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';

class Recommended extends StatelessWidget {
  final int pageId;
  const Recommended({required this.pageId, super.key});

  @override
  Widget build(BuildContext context) {
    var recommended = Get.find<RecommendedController>().recommendedList[pageId];
    Get.find<PopularController>()
        .initItem(recommended, Get.find<CartController>());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue[400],
            //  automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.ToolbarHeight,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.getInital());
                    },
                    child: AppIcon(icon: Icons.clear)),
                GetBuilder<PopularController>(builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                     controller.totalItems>=1? Get.toNamed(Routes.cart):();
                    },
                    child: Stack(
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
                    ),
                  );
                })
              ],
            ),
            expandedHeight: 300,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20))),
                child: Center(
                  child: Header(
                    text: recommended.name,
                    size: Dimensions.font26,
                  ),
                ),
              ),
            ),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.path + recommended.img,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: ExpandedText(text: recommended.description),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20 * 2.5,
                    right: Dimensions.width20 * 2.5,
                    top: Dimensions.height10,
                    bottom: Dimensions.height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.Icon24,
                      ),
                    ),
                    Header(
                      text: "\$ ${recommended.price} " +
                          " X " +
                          "${controller.cartItmes.toString()}",
                      size: Dimensions.font26,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.Icon24,
                      ),
                    )
                  ],
                )),
            Container(
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
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      )),
                  GestureDetector(
                    onTap: () {
                      Get.find<PopularController>().addItem(recommended);
                    },
                    child: Container(
                      child: Header(
                        text: " \$ ${recommended.price} |  Add To Cart ",
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.height20,
                          top: Dimensions.height20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
