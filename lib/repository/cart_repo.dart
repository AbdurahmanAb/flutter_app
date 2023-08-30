import 'dart:convert';

import 'package:e_commerce/utils/appConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPrefences;
  CartRepo({required this.sharedPrefences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    var time = DateTime.now().toString();
    cart = [];
    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });
    sharedPrefences.setStringList(AppConstants.cartList, cart);
    //  print(sharedPrefences.getStringList(AppConstants.cartList));

    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPrefences.containsKey(AppConstants.cartList)) {
      carts = sharedPrefences.getStringList(AppConstants.cartList)!;
      print("inside" + carts.toString());
    }
    List<CartModel> cartList = [];
    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }

  void addToCartHistory() {
    if (sharedPrefences.containsKey(AppConstants.cartHistory)) {
      cartHistory = sharedPrefences.getStringList(AppConstants.cartHistory)!;
    }
    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPrefences.setStringList(AppConstants.cartHistory, cartHistory);
  }

  void removeCart() {
    sharedPrefences.remove(AppConstants.cartList);
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPrefences.containsKey(AppConstants.cartHistory)) {
      cartHistory = sharedPrefences.getStringList(AppConstants.cartHistory)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }
}
