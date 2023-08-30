import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/utils/Dimensions.dart';
import 'package:e_commerce/utils/appConstants.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:e_commerce/widgets/headers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var ItemsPerorder = Get.find<CartController>().getItemsPerOrder();
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    print("ItemsPerOrder is" + ItemsPerorder.toString());

    List<int> orderTimes = ItemsPerorder.entries.map((e) => e.value).toList();
    int saveCounter = 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 95,
              padding: EdgeInsets.only(
                  left: Dimensions.height20,
                  top: Dimensions.height20,
                  right: Dimensions.height20),
              color: AppColors.mainColor,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Header(
                      text: "Cart History",
                      color: Colors.white,
                      size: 20,
                    ),
                    AppIcon(
                      icon: Icons.shopping_cart,
                      iconColor: AppColors.mainColor,
                    )
                  ]),
            ),
            Container(
              height: 700,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (saveCounter < getCartHistoryList.length) {
                    saveCounter++;
                  }
                  return Container(
                   height: 80,
                   width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                     // fit: BoxFit.cover,
                      image: NetworkImage(
                      
                      AppConstants.BASE_URL+AppConstants.path+getCartHistoryList[saveCounter-1].img!),
                        ),
                  ),
                  );
                },
                itemCount: ItemsPerorder.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
