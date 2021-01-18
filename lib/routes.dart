import 'package:flutter/material.dart';
import 'package:weather_app/Views/home_view.dart';
import 'package:weather_app/Views/login_view.dart';
import 'package:weather_app/Views/register_view.dart';
import 'package:weather_app/Views/splash_screen_view.dart';

class Routings {
  static Route<dynamic> routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "loginView":
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginView());
        break;
      case "registerView":
        return MaterialPageRoute(
            builder: (BuildContext context) => RegisterView());
        break;
      case "spashScreenView":
        return MaterialPageRoute(builder: (BuildContext context) => SpalshScreenView());
        break;
      case "homeView":
        return MaterialPageRoute(builder: (BuildContext context) => HomeView());
        break;
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => SafeArea(
            child: Scaffold(
              body: Center(
                child: Text("No Routes for ${routeSettings.name}"),
              ),
            ),
          ),
        );
        break;
    }
  }
}
