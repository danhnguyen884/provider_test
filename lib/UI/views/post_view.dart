import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base_app/UI/shared/app_colors.dart';
import 'package:provider_base_app/UI/shared/app_styles.dart';
import 'package:provider_base_app/UI/shared/ui_helpers.dart';
import 'package:provider_base_app/UI/widgets/comments_widget.dart';
import 'package:provider_base_app/UI/widgets/like_button.dart';
import 'package:provider_base_app/core/models/post.dart';
import 'package:provider_base_app/core/models/user.dart';

/*
 * PostsView will be handled differently. Posts has already been fetched.
 * When user sees a Post, that post has been populated through the constructor.
 * But comments related to that post has to be fetched and shown separately.
 * Hence we'll create a separate widget along with view model related to that widget.
 **/
class PostView extends StatelessWidget {
  final Post post;

  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpaceLarge(),
            Text(
              post.title,
              style: headerStyle,
            ),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            LikeButton(postId: post.id,),
            CommentsWidget(post.id)
          ],
        ),
      ),
    );
  }
}
