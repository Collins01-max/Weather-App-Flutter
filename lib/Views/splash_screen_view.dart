import 'package:flutter/material.dart';
import 'package:weather_app/Utilities/constants.dart';

class SpalshScreenView extends StatefulWidget {
  @override
  _SpalshScreenViewState createState() => _SpalshScreenViewState();
}

class _SpalshScreenViewState extends State<SpalshScreenView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      print("SPLASH SCREEN VIEW ...");
      Navigator.pushNamed(context, "homeView");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    Constants.appName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 21),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Showing weather anywhere,\n more basic info",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
