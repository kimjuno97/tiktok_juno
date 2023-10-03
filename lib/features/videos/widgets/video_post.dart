import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  const VideoPost({
    super.key,
    required this.onVideoFinished,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video.mp4");

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      /// _videoPlayerController.value.duration은 동영상의 총 길이입니다.
      /// _videoPlayerController.value.position은 현재 재생중인 동영상의 위치입니다.
      /// ex) 총길이 15초 중 현재 8초에 위치함
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished;
      }
    }
  }

  Future<void> _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    _videoPlayerController.play();
    setState(() {});
    _videoPlayerController.addListener(_onVideoChange);
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _videoPlayerController.value.isInitialized
              ? VideoPlayer(_videoPlayerController)
              : Container(
                  color: Colors.black,
                ),
        ),
      ],
    );
  }
}
