// part of 'route_import.dart';

import 'package:mukabbir/application/main_config/routes/route_import.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutePath.initialRoute:
        return PageRouter.fadeScale(() => SplashScreen());
      case RoutePath.loginScreen:
        return PageRouter.fadeScale(() => UserScreen());

      case RoutePath.profileScreen:
        return PageRouter.fadeScale(() => ProfileScreen(post: args as UserPostData));

      case RoutePath.changePasswordScreen:
        return PageRouter.fadeScale(() => ChangePasswordScreen(userId: args as String));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Container(
            color: Style.scaffoldBackground,
            child: const Text('Page Not Found'),
          ),
        ),
      );
    });
  }
}
