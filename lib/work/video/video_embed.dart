import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:youtube_metadata/youtube_metadata.dart';

class VideoEmbed extends StatefulWidget {
  final String url;
  const VideoEmbed({Key? key, required this.url}) : super(key: key);

  @override
  State<VideoEmbed> createState() => _VideoEmbedState();
}

class _VideoEmbedState extends State<VideoEmbed> {
  bool showFrame = false;
  late PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      podPlayerConfig: const PodPlayerConfig(autoPlay: false),
      playVideoFrom: PlayVideoFrom.youtube(widget.url),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(controller: controller);
  }
}
