import 'package:flutter/foundation.dart';
import 'package:weather_app/enums/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _viewState = ViewState.Idle;
  ViewState get viewState => _viewState;
  setViewState(ViewState state) {
    _viewState = state;
    notifyListeners();
  }
}
