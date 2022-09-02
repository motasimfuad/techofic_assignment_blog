import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/blog/fav_blogs_controller.dart';
import '../../controller/blog/state/blog_state.dart';
import 'components/blog_card.dart';

class FavoriteBlogsScreen extends ConsumerStatefulWidget {
  const FavoriteBlogsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FavoriteBlogsScreen> createState() =>
      _FavoriteBlogsScreenState();
}

List blogsList = [];

class _FavoriteBlogsScreenState extends ConsumerState<FavoriteBlogsScreen> {
  @override
  Widget build(BuildContext context) {
    final blogsListState = ref.watch(favBlogsProvider);
    blogsList = blogsListState is FavBlogsListSuccessState
        ? blogsListState.blogsList
        : [];

    print("blogsList: $blogsList");

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Blogs')),
      body: blogsListState is FavBlogsListSuccessState
          ? ListView.builder(
              itemCount: blogsList.length,
              itemBuilder: (BuildContext context, int index) {
                return BlogCard(blogModel: blogsList[index]);
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
