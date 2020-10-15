// this page is for routing
import 'package:flutter/material.dart';

import 'Screens/login_screen.dart';
import 'Screens/register_screen.dart';
import 'Screens/welcome_screen.dart';

const String initialRoute = 'welcome';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'welcome':
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case 'sign_up':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
