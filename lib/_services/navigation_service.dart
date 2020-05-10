import 'package:flutter/widgets.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> replaceTo(String routeName) {
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  Future<dynamic> reset(String routeName) {
    return navigatorKey.currentState
        .pushNamedAndRemoveUntil(routeName, ModalRoute.withName("/"));
  }

  void goBackUntil(int times) {
    int count = 0;
    return navigatorKey.currentState.popUntil((_) => count++ >= times);
  }

  bool goBack() {
    return navigatorKey.currentState.pop();
  }
}
