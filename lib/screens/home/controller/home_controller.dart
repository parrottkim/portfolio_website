import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeController extends ChangeNotifier {
  late VideoPlayerController _controller;
  VideoPlayerController get controller => _controller;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  loadVideo() {
    _controller = VideoPlayerController.asset('assets/videos/home.mp4')
      ..initialize().then((_) {
        _controller.setVolume(0);
        _controller.setLooping(false);
        _isLoaded = true;
      });
    // _controller.addListener(() {
    //   if (_controller.value.position == _controller.value.duration) {
    //     print('ended');
    //   }
    // });
    notifyListeners();
  }

  playVideo() async {
    await _controller.play();
  }
}
