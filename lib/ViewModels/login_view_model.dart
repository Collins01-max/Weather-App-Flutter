import 'package:flutter/foundation.dart';
import 'package:weather_app/Services/auth_service.dart';
import 'package:weather_app/Services/dialog_service.dart';
import 'package:weather_app/ViewModels/base_model.dart';
import 'package:weather_app/enums/view_state.dart';
import 'package:weather_app/locator.dart';

class LoginViewModel extends BaseModel {
  final authService = locator<AuthService>();
  final dialogService = locator<DialogService>();

  login({
    @required String email,
    @required String password,
  }) async {
    try {
      setViewState(ViewState.Busy);
      var result = await authService.loginWithEmail(
        email: email,
        password: password,
      );
      setViewState(ViewState.Idle);
      if (result is bool) {
        print("Result is bool");
      } else {
        await dialogService.showDialog(
            buttonTitle: "OK",
            description: "$result",
            title: "An Error Occured Signing Up");
      }
    } catch (e) {
      setViewState(ViewState.Idle);
      print("The errror was $e");
    }
  }
}
