import 'package:flutter/material.dart';

class BottomNavBar {
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Profile',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.credit_card_outlined),
      label: 'Checkout',
    ),
  ];

  
}
