
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/components/card/not_found_navigation_widget.dart';
import 'package:fluttermvvmtemplate/core/constants/navigaton/navigation_constants.dart';
import 'package:fluttermvvmtemplate/view/authenticate/test/view/test_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestsView());
      default:
        return normalNavigate(NotFoundNavigationWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget
    );
  }
}