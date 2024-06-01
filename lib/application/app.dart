import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mukabbir/application/core/scroll_behavior.dart';
import 'package:mukabbir/application/main_config/routes/route_generator.dart';
import 'package:mukabbir/application/main_config/routes/route_path.dart';
import 'package:mukabbir/common/app_theme.dart';
import 'package:mukabbir/constant/style.dart';
import 'package:mukabbir/main.dart';
import 'package:mukabbir/ui/base/base_mixin.dart';

class Mukabbir extends StatelessWidget with BaseMixin {
  final SetRegisteredRoutes? route;
  Mukabbir({super.key, this.route});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Mukabbir',
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: child ?? const SizedBox(),
          );
        },
        initialRoute: RoutePath.initialRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigator.key(),
        color: Style.primaryColor,
        theme: AppTheme.getAppThemeData());
  }
}
