import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infraestructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  // todo: repository, datasource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    // mapping the info
    for (var localVideoPostJson in videoPosts) {
      videos.add(
          LocalVideoModel.fromJson(localVideoPostJson).toVideoPostEntity());
    }

    initialLoading = false;
    notifyListeners();
  }
}
