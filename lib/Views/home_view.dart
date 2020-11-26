import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(5)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.grid_on),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      Spacer(),
                      IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {},
                          color: Colors.white)
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "San Fracisco",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 19),
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
