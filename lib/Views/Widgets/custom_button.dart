import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  final Function function;
  final String title;
  final Color color;
  CustomButon({this.color, this.function, this.title});
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      height: 50,
      width: orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width * 0.87
          : MediaQuery.of(context).size.width * 0.70,
      child: RaisedButton(
        color: color,
        onPressed: function,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
