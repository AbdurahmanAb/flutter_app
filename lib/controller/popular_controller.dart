import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/model/popular_model.dart';
import 'package:e_commerce/repository/popular_repo.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularController extends GetxController {
  final PopularRepo popularRepo;
  PopularController({required this.popularRepo});

  List<dynamic> _popularList = [];
  List<dynamic> get popularList => _popularList;

  int _quantity = 0;
  int get quantity => _quantity;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _cartItems = 0;
  int get cartItmes => _cartItems + _quantity;

  late CartController _cart;

  Future<void> getPopularList() async {
    Response response = await popularRepo.getPopularList();
    if (response.statusCode == 200) {
      _isLoaded = true;
      print("From Popular Controller");
      _popularList = [];
      _popularList
          .addAll(PopularModel.fromJson(response.body).products as Iterable);
      //_popularList.addAll();
      update();
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_cartItems + quantity < 0) {
      Get.snackbar(
        "ItemCount",
        "You can't Reduce More",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (_cartItems + quantity > 20) {
      Get.snackbar("ItemCount", "You Can't add more",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initItem(Products product, CartController cart) {
    _quantity = 0;
    _cartItems = 0;
    _cart = cart;
    var exist = false;
    exist = cart.existInCart(product);
    if (exist) {
      _cartItems = cart.getQuantity(product);
    }
  }

  void addItem(Products product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _cartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("Product Id is " +
          key.toString() +
          " " +
          "Quantity is " +
          value.quantity.toString());
    });
  }

  int get totalItems {
    return _cart.totalItem;
  }
}
