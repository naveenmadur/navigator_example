import 'package:flutter/material.dart';
import 'pages_delegate.dart';

class PageBackButtonDispatcher extends RootBackButtonDispatcher {
  final PageDelegate _pageDelegate;

  PageBackButtonDispatcher(this._pageDelegate) : super();

  @override
  Future<bool> didPopRoute() {
    return _pageDelegate.popRoute();
  }
}
