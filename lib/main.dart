import 'package:bootcamp_app/controller/blog/blogs_list_controller.dart';
import 'package:bootcamp_app/views/screens/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/blog/fav_blogs_controller.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    ref.read(blogsListProvider.notifier).fetchBlogsList();
    ref.read(favBlogsProvider.notifier).fetchFavBlogsList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Project for Bootcamp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BottomNav(),
    );
  }
}
