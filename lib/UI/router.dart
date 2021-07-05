import 'package:flutter/material.dart';
import 'package:provider_base_app/UI/views/home_view.dart';
import 'package:provider_base_app/UI/views/login_view.dart';
import 'package:provider_base_app/UI/views/post_view.dart';
import 'package:provider_base_app/core/models/post.dart';

const String initialRoute = "login";

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final routePath = settings.name;

    print("settings.name: $routePath");

    switch (routePath) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/post':
        final post = args as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
