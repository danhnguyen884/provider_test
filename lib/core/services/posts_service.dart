import 'package:provider_base_app/core/models/post.dart';
import 'package:provider_base_app/core/services/Api.dart';
import 'package:provider_base_app/locator.dart';

class PostsService {
  Api _api = locator<Api>();

  List<Post> _posts;
  List<Post> get posts => _posts;

  Future getPostsForUser(int userId) async {
    _posts = await _api.getPostsForUser(userId);
  }
  
  void incrementLikes(int postId) {
    _posts.firstWhere((post) => post.id == postId).likes++;
  }
}