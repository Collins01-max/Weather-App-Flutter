import 'package:flutter/material.dart';
import 'package:weather_app/Views/splash_screen_view.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/routes.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SpalshScreenView(),
      onGenerateRoute: Routings.routes,
    );
  }
}
