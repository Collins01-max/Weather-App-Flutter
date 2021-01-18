import 'package:flutter/material.dart';
import 'package:weather_app/ViewModels/search_viewmodel.dart';
import 'package:weather_app/Views/base_view.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SearchViewModel>(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: TextField(
                  onSubmitted: (String value) {
                    print(value);
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
