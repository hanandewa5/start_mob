import 'package:start_mob/_constants/paths.dart';
import 'package:flutter/material.dart';
import 'package:start_mob/_config/locator.dart';
import 'package:start_mob/_config/router.dart' as router;
import 'package:start_mob/_services/navigation_service.dart';
import 'package:start_mob/views/_helpers/size_config.dart';
import 'package:start_mob/views/_helpers/styling.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'Start',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              onGenerateRoute: router.generateRoute,
              initialRoute: Paths.LoginRoute,
              navigatorKey: locator<NavigationService>().navigatorKey,
            );
          },
        );
      },
    );
  }
}
