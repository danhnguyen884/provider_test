import 'package:provider_base_app/core/enums/viewstate.dart';
import 'package:provider_base_app/core/services/authentication_service.dart';
import 'package:provider_base_app/core/viewmodels/base_view_model.dart';
import 'package:provider_base_app/locator.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);

    if (userId == null) {
      setError("Value entered is not a number");
      return false;
    }

    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }

}