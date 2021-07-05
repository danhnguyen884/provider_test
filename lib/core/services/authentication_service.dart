import 'dart:async';

import 'package:provider_base_app/core/models/user.dart';
import 'package:provider_base_app/core/services/Api.dart';
import 'package:provider_base_app/locator.dart';

class AuthenticationService {

  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;

    if (hasUser) {
      userController.add(fetchedUser);
    }

    print(fetchedUser);

    return hasUser;
  }
}