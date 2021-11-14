import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/datanews.dart';
import 'package:news/news.dart';
import 'package:news/posts_cubit.dart';

class PostsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostsCubit, List<dynamic>>(
        builder: (context, posts) {
          if (posts.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  title: posts[index].title == null
                      ? Text("null")
                      : Text(posts[index].title),
                ));
              });
        },
      ),
    );
  }
}
