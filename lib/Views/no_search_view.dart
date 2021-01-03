import 'package:flutter/material.dart';

class NoSearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(),
      ),
    );
  }

  Widget buildSearchField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.72,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(35),
        ),
      ),
      child: TextField(
        textInputAction: TextInputAction.go,
        onSubmitted: (String value) {},
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
