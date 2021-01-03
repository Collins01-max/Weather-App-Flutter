import 'package:flutter/material.dart';
import 'package:weather_app/Utilities/colors.dart';

class CustomButton extends StatelessWidget {
  final Function function;
  final String title;
  CustomButton({this.function, this.title});
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      height: 50,
      width: orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width * 0.85
          : MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: color2,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: RaisedButton(
        onPressed: function,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
