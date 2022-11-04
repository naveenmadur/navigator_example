import 'package:flutter/material.dart';
import 'package:navigator_example/features/shopping/presentation/pages/cart/cart.dart';
import 'package:navigator_example/features/shopping/presentation/pages/checkout/checkout.dart';
import 'package:navigator_example/features/shopping/presentation/pages/home/home_page.dart';
import 'package:navigator_example/features/shopping/presentation/pages/login/login_page.dart';
import 'package:navigator_example/features/shopping/presentation/pages/profile/profile.dart';
import 'package:navigator_example/main.dart';

class Pages {
  List<Page<dynamic>> pagesList(
      ValueChanged<AppPages> handelPage, String myRoute) {
    return [
      const MaterialPage(
        key:  ValueKey('LoginPage'),
        child: LoginPage(),
      ),
      if (myRoute == '/home')
        const MaterialPage(
          key: HomePage.valueKey,
          child: HomePage(
          ),
        ),
      if (myRoute == '/cart')
        const MaterialPage(
          key: Cart.valueKey,
          child: Cart(),
        ),
      if (myRoute == '/profile')
        const MaterialPage(
          key: Profile.valueKey,
          child: Profile(),
        ),
      if (myRoute == '/checkout')
        const MaterialPage(
          key: Checkout.valueKey,
          child: Checkout(),
        ),
    ];
  }
}
