import 'package:flutter/foundation.dart';
import 'package:provider_base_app/core/enums/viewstate.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setError(String errorMessage) {
    _errorMessage = errorMessage;

    setState(_errorMessage != "" ? ViewState.Error : ViewState.Idle);
  }
}
