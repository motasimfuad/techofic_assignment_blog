import 'package:bootcamp_app/controller/blog/state/blog_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/blog_model.dart';
import '../../network/endpoints.dart';
import '../../network/network_utils.dart';
import '../base/base_state.dart';

final favBlogsProvider = StateNotifierProvider<FavBlogsController, BaseState>(
    (ref) => FavBlogsController(ref: ref));

class FavBlogsController extends StateNotifier<BaseState> {
  final Ref? ref;
  FavBlogsController({this.ref}) : super(const InitialState());

  List<BlogModel> favBlogsList = [];

  Future fetchFavBlogsList() async {
    state = const LoadingState();

    try {
      dynamic responseBody = await Network.handleResponse(
        await Network.getRequest(API.getFavAllBlogs),
      );
      if (responseBody != null) {
        favBlogsList = (responseBody['data'] as List<dynamic>)
            .map((x) => BlogModel.fromJson(x))
            .toList();

        state = FavBlogsListSuccessState(favBlogsList);
      } else {
        state = const ErrorState();
      }
    } catch (error) {
      state = const ErrorState();
    }
  }
}
