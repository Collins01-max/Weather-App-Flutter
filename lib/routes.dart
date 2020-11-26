import 'package:flutter/material.dart';
import 'package:weather_app/Views/home_view.dart';

class Routins {
  static Route<dynamic> routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "loginView":
        return MaterialPageRoute(builder: (BuildContext context) => null);
        break;
      case "signUpView":
        return MaterialPageRoute(builder: (BuildContext context) => null);
        break;
      case "spashScreenView":
        return MaterialPageRoute(builder: (BuildContext context) => null);
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
