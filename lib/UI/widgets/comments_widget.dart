import 'package:flutter/material.dart';
import 'package:provider_base_app/UI/shared/app_colors.dart';
import 'package:provider_base_app/UI/shared/ui_helpers.dart';
import 'package:provider_base_app/UI/views/base_view.dart';
import 'package:provider_base_app/core/enums/viewstate.dart';
import 'package:provider_base_app/core/models/comment.dart';
import 'package:provider_base_app/core/viewmodels/comments_view_model.dart';

class CommentsWidget extends StatelessWidget {
  final int postId;

  CommentsWidget(this.postId);

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsViewModel>(
      onModelReady: (viewModel) => viewModel..fetchComments(postId),
      builder: (context, viewModel, child) => viewModel.state == ViewState.Busy
          ? Center(child: CircularProgressIndicator())
          : Expanded(
              child: ListView(
              children: viewModel.comments
                  .map((comment) => CommentItem(comment))
                  .toList(),
            )),
    );
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall(),
          Text(comment.body),
        ],
      ),
    );
  }
}
