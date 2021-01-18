import 'package:flutter/material.dart';
import 'package:weather_app/ViewModels/home_view_model.dart';
import 'package:weather_app/Views/base_view.dart';
import 'package:weather_app/enums/view_state.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // ignore: unused_field
  bool showField = false;
  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          body: Stack(
            children: [
              HomeContentView(
                showField: showField,
                model: model,
                scaffoldKey: scaffoldKey,
              ),
              model.viewState == ViewState.Busy
                  ? Center(child: CircularProgressIndicator())
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class HomeContentView extends StatefulWidget {
  bool showField;
  HomeViewModel model;
  GlobalKey<ScaffoldState> scaffoldKey;
  HomeContentView({
    @required this.showField,
    @required this.model,
    @required this.scaffoldKey,
  });

  @override
  _HomeContentViewState createState() => _HomeContentViewState();
}

class _HomeContentViewState extends State<HomeContentView> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            // !field should be here.
            widget.showField
                ? buildSearchField(context: context, model: widget.model)
                : Container(),
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
                        size: 50,
                      ),
                      onPressed: () {
                        setState(() => widget.showField = true);
                      })
                ],
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }

  Widget buildSearchField({BuildContext context, HomeViewModel model}) {
    return Container(
      height: 47,
      width: 375,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: TextField(
        controller: searchController,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          // print("Searching for selected Zone.....");
          // model.onSearch(value: searchController.text);
          if (searchController.text == "") {
            FocusScope.of(context).unfocus();

            widget.scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(
                  "Sorry, the search field cannot be empty. Please enter some text and try again."),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.lime,
            ));
          } else {
            print("Searching for selected Zone.....");
            model.onSearch(value: searchController.text);
          }
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() => widget.showField = false);
            },
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
