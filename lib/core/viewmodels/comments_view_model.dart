import 'package:provider_base_app/core/enums/viewstate.dart';
import 'package:provider_base_app/core/models/comment.dart';
import 'package:provider_base_app/core/services/Api.dart';
import 'package:provider_base_app/core/viewmodels/base_view_model.dart';
import 'package:provider_base_app/locator.dart';

class CommentsViewModel extends BaseViewModel {
   Api _api = locator<Api>();

   List<Comment> comments;

   Future fetchComments(int postId) async {
     setState(ViewState.Busy);

     comments = await _api.getCommentsForPost(postId);

     setState(ViewState.Idle);
   }
}