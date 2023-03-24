import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/View/Custom%20header%20view/custom_header_view.dart';
import 'package:pitch_me_app/View/Select%20industry/select_industry.dart';
import 'package:pitch_me_app/View/navigation_controller.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:pitch_me_app/utils/strings/strings.dart';
import 'package:pitch_me_app/utils/widgets/Arrow%20Button/arrow_button.dart';
import 'package:video_viewer/video_viewer.dart';

class DemoVideoPage extends StatefulWidget {
  const DemoVideoPage({super.key});

  @override
  State<DemoVideoPage> createState() => _DemoVideoPageState();
}

class _DemoVideoPageState extends State<DemoVideoPage> {
  final NavigationController _navigationController =
      Get.put(NavigationController());
  late VideoPlayerController _videoPlayerController;
  bool isLoading = false;
  bool isCheck = false;

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.network(
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4');
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    //await _videoPlayerController.play();
  }

  repalyVideo() async {
    await _videoPlayerController.play();
  }

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    _initVideoPlayer();

    Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomHeaderView(
            title: TextStrings.textKey['post_seles']!,
            icon: 'assets/images/record.png',
            subTitle: TextStrings.textKey['post_seles_sub']!,
            progressPersent: 0.0,
            padding: 15,
          ),
          const SizedBox(height: 20),
          Expanded(
              flex: 6,
              child: isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(
                      color: DynamicColor.blue,
                    ))
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _videoPlayerController.value.isPlaying
                                  ? _videoPlayerController.pause()
                                  : _videoPlayerController.play();
                            });
                          },
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: VideoPlayer(_videoPlayerController))),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isCheck = true;
                                  _videoPlayerController.value.isPlaying
                                      ? _videoPlayerController.pause()
                                      : _videoPlayerController.play();
                                });
                              },
                              child: _videoPlayerController.value.isPlaying
                                  ? Container()
                                  : Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/white_box.png",
                                          height: 100,
                                          width: 100,
                                          color: DynamicColor.white,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 0, right: 0),
                                          child: Icon(
                                            _videoPlayerController
                                                    .value.isPlaying
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                            color: DynamicColor.blue,
                                            size: 50,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ],
                        )
                      ],
                    )),
          Expanded(
              flex: 1,
              child: isCheck
                  ? ArrowButton(
                      onPressed: () {
                        _videoPlayerController.pause();
                        _navigationController.navigationType.value = 'Post';
                        Get.to(() => SelectIndustryPage());
                      },
                    )
                  : Container())
        ],
      )),
    );
  }

  @override
  void dispose() {
    log('video');
    _videoPlayerController.pause();
    _videoPlayerController.dispose();

    super.dispose();
  }
}
