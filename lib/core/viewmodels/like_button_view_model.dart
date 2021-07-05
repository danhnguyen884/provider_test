import 'package:provider_base_app/core/services/posts_service.dart';
import 'package:provider_base_app/core/viewmodels/base_view_model.dart';
import 'package:provider_base_app/locator.dart';

class LikeButtonViewModel extends BaseViewModel {
  PostsService _postsService = locator<PostsService>();

  int postLiked(int postId) {
    return _postsService.posts.firstWhere((post) => post.id == postId).likes;
  }

  void increaseLikes(int postId) {
    _postsService.incrementLikes(postId);
    notifyListeners();
  }
}
