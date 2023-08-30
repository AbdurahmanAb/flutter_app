import 'package:e_commerce/model/cart_model.dart';
import 'package:e_commerce/model/popular_model.dart';
import 'package:e_commerce/repository/cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class CartController extends GetxController {
  CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;
  //only for shared Prefernces
  List<CartModel> storageItems = [];

  void addItem(Products product, int quantity) {
    var totalQuantity = 0;
    print("adding item " + product.id.toString());
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
            id: value.id,
            img: value.img,
            name: value.name,
            price: value.price,
            time: DateTime.now().toString(),
            isExist: true,
            quantity: value.quantity! + quantity,
            product: product);
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id!);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
            product.id!,
            () => CartModel(
                id: product.id,
                img: product.img,
                name: product.name,
                price: product.price,
                time: DateTime.now().toString(),
                isExist: true,
                quantity: quantity,
                product: product));
      } else {
        Get.snackbar("Cart Count", "Please Add Quantity",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  bool existInCart(Products product) {
    if (_items.containsKey(product.id!)) {
      return true;
    }
    return false;
  }

  int getQuantity(Products product) {
    var quantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.forEach((key, value) {
        if (key == product.id!) {
          quantity = value.quantity!;
        }
      });
    }

    return quantity;
  }

  int get totalItem {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) => e.value).toList();
  }

  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;
    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addToHistory() {
    cartRepo.addToCartHistory();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }

  int getPrices() {
    int value = 0;

    if (_items.isNotEmpty) {
      for (int i = 0; i < _items.length; i++) {
        value += getItems[i].quantity! * getItems[i].price!;
      }
    }

    return value;
  }

  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  Map<String, int> getItemsPerOrder() {
    Map<String, int> ItemsPerOrder = Map();
    for (int i = 0; i < getCartHistoryList().length; i++) {
      if (ItemsPerOrder.containsKey(getCartHistoryList()[i].time)) {
        ItemsPerOrder.update(
            getCartHistoryList()[i].time.toString(), (value) => ++value);
      } else {
        ItemsPerOrder.putIfAbsent(
            getCartHistoryList()[i].time.toString(), () => 1);
      }
    }

    return ItemsPerOrder;
  }
}
