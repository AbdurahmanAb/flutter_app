import 'package:e_commerce/screen/home/MainPage.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'body.dart';

class FullHome extends StatefulWidget {
  const FullHome({super.key});

  @override
  State<FullHome> createState() => _FullHomeState();
}

class _FullHomeState extends State<FullHome> {
  int _currentIndex = 0;
  List _pages = [
    Home(),

    Container(
      child: Center(child: Text("Hello")),
    ),
    Container(
      child: Center(child: Text("Hello 2")),
    ),
    Container(
      child: Center(child: Text("Hello  3")),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
currentIndex: _currentIndex,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.deepPurpleAccent,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.remove_done), label: "Red"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout_outlined), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "user")
        ],
      ),
    );
  }
}
