import 'package:flutter/material.dart';

class Component extends StatelessWidget {
  final String image;
  final double percentage;
  Component({this.image, this.percentage});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              image: DecorationImage(
                image: AssetImage(""),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
              child: Center(
            child: Text("28%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ))
        ],
      ),
    );
  }
}
