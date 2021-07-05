import 'package:flutter/material.dart';
import 'package:provider_base_app/UI/views/base_view.dart';
import 'package:provider_base_app/core/viewmodels/like_button_view_model.dart';

class LikeButton extends StatelessWidget {
  final int postId;

  LikeButton({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LikeButtonViewModel>(
      builder: (context, viewModel, child) => Row(
        children: [
          Text('Likes ${viewModel.postLiked(postId)}'),
          MaterialButton(
              color: Colors.white,
              child: Icon(Icons.thumb_up),
              onPressed: () {
                viewModel.increaseLikes(postId);
              })
        ],
      ),
    );
  }
}
