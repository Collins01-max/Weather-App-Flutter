import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 5),
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "San Francisco",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ", CA",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white70,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.redAccent,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
