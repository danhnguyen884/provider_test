import 'package:get_it/get_it.dart';
import 'package:provider_base_app/core/services/Api.dart';
import 'package:provider_base_app/core/services/authentication_service.dart';
import 'package:provider_base_app/core/services/posts_service.dart';
import 'package:provider_base_app/core/viewmodels/comments_view_model.dart';
import 'package:provider_base_app/core/viewmodels/home_view_model.dart';
import 'package:provider_base_app/core/viewmodels/like_button_view_model.dart';
import 'package:provider_base_app/core/viewmodels/login_view_model.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => PostsService());
  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => CommentsViewModel());
  locator.registerFactory(() => LikeButtonViewModel());
}