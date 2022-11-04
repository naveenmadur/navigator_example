import 'package:navigator_example/main.dart';

const String cartPath = '/cart';
const String homePath = '/home';
const String profilePath = '/profile';
const String checkoutPath = '/checkout';
const String loginPath = '/login';

class PageConfig {
  final String key;
  final String path;
  final AppPages appPage;
  PageConfig({
    required this.key,
    required this.path,
    required this.appPage,
  });
}

  PageConfig cartConfig =
      PageConfig(key: 'Cart', path: cartPath, appPage: AppPages.cart);
  PageConfig homeConfig =
      PageConfig(key: 'Home', path: homePath, appPage: AppPages.home);
  PageConfig profileConfig =
      PageConfig(key: 'Profile', path: profilePath, appPage: AppPages.profile);
  PageConfig checkoutConfig =
      PageConfig(key: 'Checkout', path: checkoutPath, appPage: AppPages.checkout);
  PageConfig loginConfig =
      PageConfig(key: 'Login', path: loginPath, appPage: AppPages.login);
