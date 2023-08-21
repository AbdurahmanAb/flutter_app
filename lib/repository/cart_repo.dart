import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPrefences;
  CartRepo({required this.sharedPrefences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    cartList.forEach((element) {
      cart.add(jsonEncode(element));
    });
    sharedPrefences.setStringList("cartList", cart);
    //  print(sharedPrefences.getStringList("cartList"));

    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPrefences.containsKey("cartList")) {
      carts = sharedPrefences.getStringList("cartList")!;
      print("inside" + carts.toString());
    }
    List<CartModel> cartList = [];
    carts.forEach((element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }
}
