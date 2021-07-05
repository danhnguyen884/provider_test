import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base_app/UI/shared/app_styles.dart';
import 'package:provider_base_app/UI/shared/ui_helpers.dart';
import 'package:provider_base_app/UI/views/base_view.dart';
import 'package:provider_base_app/UI/widgets/post_item.dart';
import 'package:provider_base_app/core/enums/viewstate.dart';
import 'package:provider_base_app/core/models/post.dart';
import 'package:provider_base_app/core/models/user.dart';
import 'package:provider_base_app/core/viewmodels/home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (viewModel)  =>  viewModel.getPosts(Provider.of<User>(context).id),
      builder: (context, viewModel, child)  => Scaffold(
        backgroundColor: Colors.greenAccent,
        body: viewModel.state == ViewState.Busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Welcome ${Provider.of<User>(context).name}",
                      style: headerStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Here are all your posts",
                      style: subHeaderStyle,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                   Expanded(child: getPostsUi(viewModel.posts))
                ],
              ),
      ),
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder (
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
            post: posts[index],
            onTap: () {
              Navigator.pushNamed(context, "/post", arguments: posts[index]);
            }),
      );
}
