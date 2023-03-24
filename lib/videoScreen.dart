import 'package:flutter/material.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/widgets/extras/directVideoViewer.dart';
import 'package:video_viewer/domain/bloc/controller.dart';
import 'package:video_viewer/video_viewer.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoViewerControllerList.add(VideoViewerController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width(context),height:height(context),
        child:VideoViewer(
          controller: videoViewerControllerList[0],
          autoPlay: true,
          looping: true,
          style: VideoViewerStyle(
            thumbnail: Image.network(''),
          ),
          source: {
            "Source": VideoSource(
              video: VideoPlayerController.network("https://videos.taggy.cam/zIgmdoUFDINJyN4gYrAMMhffgyHZ3oyurbccAWyysiH3XdZs9U/scenes/scene-995.m3u8"),
            )
          },
        ))
    );
  }
}
