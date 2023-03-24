import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/View/Custom%20header%20view/new_bottom_bar.dart';
import 'package:pitch_me_app/View/selected_data_view/selected_page.dart';
import 'package:pitch_me_app/View/success%20page/success_page.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../../utils/colors/colors.dart';
import '../../utils/styles/styles.dart';
import '../../utils/widgets/Arrow Button/arrow_button.dart';
import '../Custom header view/custom_header_view.dart';
import 'Controller/controller.dart';

class VideoPage extends StatefulWidget {
  final String filePath;
  final String title;
  const VideoPage({Key? key, required this.filePath, required this.title})
      : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  final VideoFirstPageController _videoFirstPageController =
      Get.put(VideoFirstPageController());

  final _controller = PageController();

  int selectIndex = 2;
  int nextPage = 0;

  bool isSelectedScreen = true;
  bool isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
      _videoFirstPageController.videoUrl.value = widget.filePath;
    });

    _initVideoPlayer();

    Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    //await _videoPlayerController.play();
  }

  repalyVideo() async {
    await _videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          nextPage == 0
              ? ArrowButton(onPressed: () {
                  _videoPlayerController.removeListener(() {});
                  _videoPlayerController.dispose();
                  _videoPlayerController.pause();
                  Get.off(() => const SuccessPage())!.then((value) {
                    setState(() {});
                  });
                })
              : Container(),
          NewCustomBottomBar()
        ],
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
              color: DynamicColor.blue,
            ))
          : SafeArea(
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.vertical,
                onPageChanged: (value) {
                  setState(() {
                    nextPage = value;
                  });
                },
                children: [
                  Stack(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              _videoPlayerController.value.isPlaying
                                  ? _videoPlayerController.pause()
                                  : _videoPlayerController.play();
                            });
                          },
                          child: VideoPlayer(_videoPlayerController)),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: CustomHeaderView(
                          title: '',
                          icon: '',
                          subTitle: '',
                          progressPersent: 1,
                          padding: 0,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                alignment: Alignment.center,
                                child: Text(
                                  widget.title,
                                  style: white21wBold,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
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
                                          "assets/images/video_bg.png",
                                          height: 100,
                                          width: 100,
                                        ),
                                        Icon(
                                          _videoPlayerController.value.isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: DynamicColor.white,
                                          size: 50,
                                        ),
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: SizeConfig.getSize10(context: context),
                              right: 5),
                          child: GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.linear);
                            },
                            child: RotatedBox(
                                quarterTurns: 4,
                                child: Image.asset(
                                  "assets/Phase 2 icons/ic_keyboard_arrow_down_24px.png",
                                  color: DynamicColor.white,
                                  height:
                                      SizeConfig.getSize35(context: context),
                                  width: SizeConfig.getSize35(context: context),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SelectedPage(
                    showIcon: nextPage,
                    pageController: _controller,
                  )
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _videoPlayerController.pause();

    super.dispose();
  }
}
