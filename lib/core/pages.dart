import 'package:flutter/material.dart';
import 'package:navigator_example/features/shopping/presentation/pages/cart/cart.dart';
import 'package:navigator_example/features/shopping/presentation/pages/checkout/checkout.dart';
import 'package:navigator_example/features/shopping/presentation/pages/home/home_page.dart';
import 'package:navigator_example/features/shopping/presentation/pages/login/login_page.dart';
import 'package:navigator_example/features/shopping/presentation/pages/profile/profile.dart';
import 'package:navigator_example/main.dart';

class Pages {
  List<Page<dynamic>> pagesList(ValueChanged<AppPages> handelPage,
      ValueChanged<bool> handelLogin, bool login, AppPages? currentPage) {
    return [
      MaterialPage(
        key: const ValueKey('LoginPage'),
        child: LoginPage(isLogin: handelLogin),
      ),
      if (login)
        MaterialPage(
          key: HomePage.valueKey,
          child: HomePage(
            currentPage: handelPage,
          ),
        ),
      if (currentPage == AppPages.cart)
        const MaterialPage(
          key: Cart.valueKey,
          child: Cart(),
        ),
      if (currentPage == AppPages.profile)
        const MaterialPage(
          key: Profile.valueKey,
          child: Profile(),
        ),
      if (currentPage == AppPages.checkout)
        const MaterialPage(
          key: Checkout.valueKey,
          child: Checkout(),
        ),
    ];
  }
}
