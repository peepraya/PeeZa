import 'package:flutter/material.dart';
import 'package:pee_tpa/models/pee_video_model.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  final PeeVideoModel peeVideoModel;
  PlayVideo({Key key, this.peeVideoModel}) : super(key: key);

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  // Explicit
  PeeVideoModel peeVideoModel;
  ChewieController chewieController;
  VideoPlayerController videoPlayerController;
  String urlVideo;

  @override
  void initState() {
    super.initState();
    setState(() {
      peeVideoModel = widget.peeVideoModel;
      urlVideo = peeVideoModel.pathVideo;

      videoPlayerController = VideoPlayerController.network(urlVideo);
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: false
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose(); //ตัดการใช้ Service
    videoPlayerController.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Video ${peeVideoModel.name}'),
      ),
      body: Center(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
