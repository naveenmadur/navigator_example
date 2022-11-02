import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigator_example/core/pages.dart';
import 'package:navigator_example/features/shopping/presentation/pages/checkout/checkout.dart';
import 'features/shopping/presentation/pages/cart/cart.dart';
import 'features/shopping/presentation/pages/home/home_page.dart';
import 'features/shopping/presentation/pages/profile/profile.dart';

void main() {
  runApp(const MyApp());
}

enum AppPages { home, cart, checkout, profile, error }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool login = false;
  AppPages? currentPage;
  void _handelPage(AppPages value) {
    setState(() {
      currentPage = value;
    });
  }

  void _handelLogin(bool value) {
    setState(() {
      login = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Navigator(
          pages:
              Pages().pagesList(_handelPage, _handelLogin, login, currentPage),
          onPopPage: (route, result) {
            final page = route.settings as MaterialPage;
            if (page.key == Checkout.valueKey ||
                page.key == Profile.valueKey ||
                page.key == Cart.valueKey) {
              login = true;
            }
            if (page.key == HomePage.valueKey) {
              login = false;
              currentPage = AppPages.home;
            }
            return route.didPop(result);
          },
        ),
      ),
    );
  }
}
