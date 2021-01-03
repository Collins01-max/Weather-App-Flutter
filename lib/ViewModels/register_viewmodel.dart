import 'package:flutter/foundation.dart';
import 'package:weather_app/Services/auth_service.dart';
import 'package:weather_app/Services/dialog_service.dart';
import 'package:weather_app/ViewModels/base_model.dart';
import 'package:weather_app/enums/view_state.dart';
import 'package:weather_app/locator.dart';

class RegisterViewModel extends BaseModel {
  final authService = locator<AuthService>();
  final dialogService = locator<DialogService>();

  register({
    @required String email,
    @required String password,
    @required String name,
  }) async {
    try {
      setViewState(ViewState.Busy);
      var result = await authService.signUpWithEmail(
          email: email, password: password, name: name);
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
