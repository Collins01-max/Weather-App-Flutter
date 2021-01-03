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
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              // color: Colors.green,
              image: DecorationImage(
                image: AssetImage("images/cloud1.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "50%",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
