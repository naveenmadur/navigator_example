import 'package:flutter/material.dart';
import 'package:navigator_example/core/pages.dart';
import 'package:navigator_example/features/shopping/presentation/pages/cart/cart.dart';
import 'package:navigator_example/features/shopping/presentation/pages/checkout/checkout.dart';
import 'package:navigator_example/features/shopping/presentation/pages/home/home_page.dart';
import 'package:navigator_example/features/shopping/presentation/pages/login/login_page.dart';
import 'package:navigator_example/features/shopping/presentation/pages/profile/profile.dart';
import 'package:navigator_example/main.dart';
import 'package:navigator_example/routes/pages_config.dart';

class PageDelegate extends RouterDelegate<PageConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  String get myRoute => _myRoute;
  String _myRoute = '/login';
  AppPages page = AppPages.login;
  final List<MaterialPage> _pages = [];

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Getter for a list that cannot be changed
  List<MaterialPage> get pages => List.unmodifiable(_pages);

  /// Number of pages function
  int numPages() => _pages.length;

  // @override
  // PageConfig get currentConfiguration => _pages.last.arguments as PageConfig;

  AppPages currentPage = AppPages.login;

  set myRoute(String value) {
    if (_myRoute == value) return;
    _myRoute = value;

    if (_myRoute == '/home') {
      currentPage = AppPages.home;
    }

    if (_myRoute == '/cart') {
      currentPage = AppPages.cart;
    }

    if (_myRoute == '/profile') {
      currentPage = AppPages.profile;
    }

    if (_myRoute == '/checkout') {
      currentPage = AppPages.checkout;
    }

    if (_myRoute == '/login') {
      currentPage = AppPages.login;
    }
    notifyListeners();
  }

  void _handelPage(AppPages value) {
    currentPage = value;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: Pages().pagesList(_handelPage, _myRoute),
      onPopPage: _onPopPage,
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (canPop()) {
      pop();
      if (myRoute == '/home') {
        myRoute = '/login';
      } else {
        myRoute = '/home';
      }
      return true;
    } else {
      return false;
    }
  }

  void _removePage(MaterialPage? page) {
    if (page != null) {
      _pages.remove(page);
    }
  }

  void pop() {
    if (canPop()) {
      _removePage(_pages.last);
    }
  }

  bool canPop() {
    return _pages.length > 1;
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  // MaterialPage _createPage(Widget child, PageConfig pageConfig) {
  //   return MaterialPage(
  //       child: child,
  //       key: ValueKey(pageConfig.key),
  //       name: pageConfig.path,
  //       arguments: pageConfig);
  // }

  void _addPageData(Widget child, PageConfig pageConfig) {
    MaterialPage pageToAdd = MaterialPage(
        child: child,
        key: ValueKey(pageConfig.key),
        name: pageConfig.path,
        arguments: pageConfig);
    _pages.add(pageToAdd);
  }

  void addPage(PageConfig pageConfig) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfig).appPage != pageConfig.appPage;
    if (shouldAddPage) {
      switch (pageConfig.appPage) {
        case AppPages.home:
          _addPageData(const HomePage(), homeConfig);
          break;
        case AppPages.cart:
          _addPageData(const Cart(), cartConfig);
          break;
        case AppPages.login:
          _addPageData(const LoginPage(), loginConfig);
          break;
        case AppPages.checkout:
          _addPageData(const Checkout(), checkoutConfig);
          break;
        case AppPages.profile:
          _addPageData(const Profile(), profileConfig);
          break;
      }
    }
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    _myRoute = configuration.path;
    addPage(configuration);

    notifyListeners();
  }
}
