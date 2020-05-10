import 'package:flutter/cupertino.dart';
import 'package:start_mob/_constants/paths.dart';
import 'package:flutter/material.dart';
import 'package:start_mob/views/Auth/login_view.dart';
import 'package:start_mob/views/Auth/register_view.dart';
import 'package:start_mob/views/Auth/test.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // ? AUTH
    case Paths.LoginRoute:
      return MaterialPageRoute(builder: (BuildContext context) => LoginView());
    case Paths.RegisterRoute:
      return CupertinoPageRoute(
          builder: (BuildContext context) => RegisterView());

    case Paths.TestRoute:
      return CupertinoPageRoute(
          builder: (BuildContext context) => HomeScreen());

    default:
      return MaterialPageRoute(
        builder: (BuildContext context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
