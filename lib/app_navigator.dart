import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/nav_cubit.dart';
import 'package:news/news.dart';
import 'package:news/post_details_view.dart';
import 'package:news/view.dart';


class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, News>(builder: ((context, post) {
      return Navigator(
        pages: [
          MaterialPage(child: PostsView()),
          if (post != null) MaterialPage(child: PostDetailsView(post: post))
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPosts();
          return route.didPop(result);
        },
      );
    }));
  }
}
