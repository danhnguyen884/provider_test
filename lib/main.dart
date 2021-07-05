import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base_app/UI/router.dart';
import 'package:provider_base_app/core/models/user.dart';
import 'package:provider_base_app/core/services/authentication_service.dart';
import 'package:provider_base_app/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User> (
      //initialData: User.initial(),
      create: (context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: '/',
        onGenerateRoute: RoutesGenerator.generateRoute,
      ),
    );
  }
}
