import 'package:provider_base_app/core/enums/viewstate.dart';
import 'package:provider_base_app/core/models/post.dart';
import 'package:provider_base_app/core/services/posts_service.dart';
import 'package:provider_base_app/core/viewmodels/base_view_model.dart';
import 'package:provider_base_app/locator.dart';

class HomeViewModel extends BaseViewModel {
  PostsService _postsService = locator<PostsService>();

  List<Post> get posts => _postsService.posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    await _postsService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}