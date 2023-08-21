import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/controller/popular_controller.dart';
import 'package:e_commerce/controller/recommended_controller.dart';
import 'package:e_commerce/routes/route.dart';
import 'package:e_commerce/utils/Dimensions.dart';
import 'package:e_commerce/utils/appConstants.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:e_commerce/widgets/headers.dart';
import 'package:e_commerce/widgets/subtitle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios_new,
                      iconColor: Colors.white,
                      iconSize: Dimensions.Icon24,
                      backgroundColor: AppColors.mainColor,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width30 * 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.initial);
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      iconSize: Dimensions.Icon24,
                      backgroundColor: AppColors.mainColor,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    iconSize: Dimensions.Icon24,
                    backgroundColor: AppColors.mainColor,
                  ),
                ],
              )),
          Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController) {
                    return ListView.builder(
                      itemCount: cartController.getItems.length,
                      itemBuilder: (_, index) {
                        return Container(
                          height: Dimensions.height20 * 5,
                          width: double.maxFinite,
                          child: GestureDetector(
                             onTap: () {
                              var product = Get.find<PopularController>()
                                  .popularList
                                  .indexOf(
                                      cartController.getItems[index].product!);
                              if (product >= 0) {
                                Get.toNamed(Routes.getPopular(product));
                              } else {
                                var recomm = Get.find<RecommendedController>()
                                    .recommendedList
                                    .indexOf(cartController
                                        .getItems[index].product!);
                                Get.toNamed(Routes.getRecommended(recomm));
                              }
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: Dimensions.height20 * 5,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  AppConstants.path +
                                                  cartController
                                                      .getItems[index].img!)),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: Dimensions.width15,
                                ),
                                Expanded(
                                    child: Container(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Header(
                                          text: cartController
                                              .getItems[index].name!,
                                          color: Colors.black54,
                                        ),
                                        Subtitle(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Header(
                                              text:
                                                  "\$ ${cartController.getItems[index].price!.toString()}",
                                              color: Colors.red[300],
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: Dimensions.height10,
                                                  bottom: Dimensions.height10,
                                                  left: Dimensions.width10,
                                                  right: Dimensions.width10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius20),
                                                  color: Colors.white),
                                              child: Row(children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(
                                                          cartController
                                                              .getItems[index]
                                                              .product!,
                                                          -1);
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: Dimensions.Icon24,
                                                    )),
                                                SizedBox(
                                                  width: Dimensions.width15 / 2,
                                                ),
                                                Header(
                                                    text: cartController
                                                        .getItems[index]
                                                        .quantity
                                                        .toString()),
                                                SizedBox(
                                                  width: Dimensions.width15 / 2,
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(
                                                          cartController
                                                              .getItems[index]
                                                              .product!,
                                                          1);
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      size: Dimensions.Icon24,
                                                    ))
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              )),
        ],
      ),
      bottomNavigationBar: Container(
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
                child: Header(text: "7502"),
              ),
              GestureDetector(
                onTap: () {
                //  PopularController.addItem(products);
                },
                child: Container(
                  child: Header(
                    text: " CheckOut ",
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
        ),
    );
  }
}
