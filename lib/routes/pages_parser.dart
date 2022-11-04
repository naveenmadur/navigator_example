import 'package:flutter/cupertino.dart';
import 'package:navigator_example/main.dart';
import 'package:navigator_example/routes/pages_config.dart';

class PageParser extends RouteInformationParser<PageConfig> {
  @override
  Future<PageConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return loginConfig;
    }
    final path = uri.pathSegments[0];

    switch (path) {
      case loginPath:
        return loginConfig;

      case homePath:
        return homeConfig;

      case cartPath:
        return cartConfig;

      case profilePath:
        return profileConfig;

      case checkoutPath:
        return checkoutConfig;

      default:
        return loginConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfig configuration) {
    switch (configuration.appPage) {
      case AppPages.home:
        return const RouteInformation(location: homePath);

      case AppPages.cart:
        return const RouteInformation(location: cartPath);

      case AppPages.checkout:
        return const RouteInformation(location: checkoutPath);

      case AppPages.profile:
        return const RouteInformation(location: profilePath);

      case AppPages.login:
        return const RouteInformation(location: loginPath);

      default:
        return const RouteInformation(location: loginPath);
    }
  }
}
