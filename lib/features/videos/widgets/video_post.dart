import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_juno/constants/sizes.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
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
    setState(() {});
    _videoPlayerController.addListener(_onVideoChange);
  }

  /// VisibilityDetector Widget을 활용하여 화면에 전부 보여질때 동영상이 재생되도록 함.
  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 && !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
    } else {
      _videoPlayerController.play();
    }
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
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),

          /// 화면을 전부 채우고 GestureDetector로 event만 걸어 놓는 방법
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          const Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.play,
                  color: Colors.white,
                  size: Sizes.size52,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
