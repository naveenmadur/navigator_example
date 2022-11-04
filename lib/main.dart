import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigator_example/routes/back_button_dispatcher.dart';
import 'package:navigator_example/routes/pages_config.dart';
import 'package:navigator_example/routes/pages_delegate.dart';
import 'package:navigator_example/routes/pages_parser.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

enum AppPages { home, cart, checkout, profile, login }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final delegate = PageDelegate();
  final parser = PageParser();
  PageBackButtonDispatcher? backButtonDispatcher;
  PageDelegate? delegate;

  _MyAppState(){
    delegate = PageDelegate();
    delegate!.setInitialRoutePath(loginConfig);
    backButtonDispatcher = PageBackButtonDispatcher(delegate!);
  }



  // bool _handelPopPage(Route<dynamic> route, dynamic result) {
  //   if (!route.didPop(result)) {
  //     return false;
  //   }
  //   final page = route.settings as MaterialPage;
  //   if (page.key == Checkout.valueKey ||
  //       page.key == Profile.valueKey ||
  //       page.key == Cart.valueKey) {
  //     login = true;
  //   }
  //   if (page.key == HomePage.valueKey) {
  //     login = false;
  //     currentPage = AppPages.home;
  //   }
  //   return true;
  // }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => ChangeNotifierProvider<PageDelegate>(
        create: (BuildContext context) {
          return delegate!;
        },
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          routeInformationParser: PageParser(),
          routerDelegate: delegate!,
          backButtonDispatcher: backButtonDispatcher,
        ),
      ),
    );
  }
}
