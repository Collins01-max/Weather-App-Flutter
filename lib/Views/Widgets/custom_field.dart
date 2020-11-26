import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      height: 50,
      width: orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width * 0.87
          : MediaQuery.of(context).size.width * 0.70,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          hintText: "test@test.com",
          prefixIcon: Icon(Icons.email),
          contentPadding: const EdgeInsets.only(left: 20, top: 10),
        ),
      ),
    );
  }
}
