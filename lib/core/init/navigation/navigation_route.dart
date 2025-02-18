
import 'package:flutter/material.dart';

import '../../../view/authenticate/test/view/test_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigaton/navigation_constants.dart';

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