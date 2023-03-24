import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/controller/businessIdeas/homepagecontroller.dart';
import 'package:pitch_me_app/models/post/postModel.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';
import 'package:pitch_me_app/utils/strings/images.dart';
import 'package:pitch_me_app/utils/widgets/extras/directVideoViewer.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PostPageController extends GetxController {
  var visibleSaveSeen = false.obs,
      progressOfCard = 0.0.obs,
      isPlay = true.obs,
      currentItemIndex = 0.obs,
      videoVisibilityPercent = 0.0.obs,
      appIsInBackground = false.obs,
      refreshed = false.obs;
  final SwipableStackController swipableStackController =
      SwipableStackController();
  SwipeDirection? direction;
  bool left = false, right = false;

  bool notVideo = false;
  var images = [
    Assets.dashBackgroundImage,
    Assets.postImage2,
    Assets.dashBackgroundImage,
    Assets.postImage2,
    Assets.dashBackgroundImage,
    Assets.postImage2,
  ];
  String label = "Seen";
  HomePageController _homePageController = Get.put(HomePageController());

  updateProgressOfCard(double value) {
    print("DATABCA ${value}");
    progressOfCard.value = value;
  }

  updateDirectionOfCard(SwipeDirection? value) {
    direction = value;
  }

  setVisibleSeen(bool value) {
    visibleSaveSeen.value = value;
  }

  List<String> videoUrls = [
    "https://saturncube.com/temp-video/video11.mov",
    "https://saturncube.com/temp-video/video12.mov",
    "https://saturncube.com/temp-video/video13.mov",
    "https://saturncube.com/temp-video/video14.mov",
    "https://saturncube.com/temp-video/video15.mov",
    "https://saturncube.com/temp-video/video11.mov",
    "https://saturncube.com/temp-video/video12.mov",
    "https://saturncube.com/temp-video/video13.mov",
    "https://saturncube.com/temp-video/video14.mov",
    "https://saturncube.com/temp-video/video15.mov",
    "https://saturncube.com/temp-video/video11.mov",
    "https://saturncube.com/temp-video/video12.mov",
    "https://saturncube.com/temp-video/video13.mov",
    "https://saturncube.com/temp-video/video14.mov",
    "https://saturncube.com/temp-video/video15.mov",
  ];

  Widget getSliderWidget(
      {required Result post,
      required BuildContext context,
      required int itemIndex}) {
    debugPrint("Post type is ${post.type}");
    log(' Check 2 = ' + post.file.replaceAll(' ', '%20').toString());
    switch (post.type) {
      case 1:
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          padding: EdgeInsets.only(
              left: SizeConfig.getSize20(context: context),
              right: SizeConfig.getSize20(context: context),
              bottom: SizeConfig.getSize40(context: context),
              top: SizeConfig.getSize100(context: context)),
          child: Center(
              child: SingleChildScrollView(
                  child: HtmlWidget('<center>${post.text}</center>'))),
        );
      case 2:
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: CachedNetworkImage(
              imageUrl: '${post.file}',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ],
                  )),
        );
      case 3:
        notVideo = false;
        debugPrint(
            "App is in background =${appIsInBackground.value} and visibility ${videoVisibilityPercent.value}");
        return VisibilityDetector(
          key: Key('my-widget-key'),
          onVisibilityChanged: (visibilityInfo) {
            var visiblePercentage = visibilityInfo.visibleFraction * 100;
            debugPrint(
                'Widget ${visibilityInfo.key.toString()} is ${visiblePercentage}% visible');

            try {
              videoVisibilityPercent.value = visiblePercentage;
              if (visiblePercentage < 90) {
                videoViewerControllerList[itemIndex].pause();
              }
              if (visiblePercentage > 10 &&
                  videoViewerControllerList[itemIndex].isPlaying == false &&
                  swipableStackController.currentIndex == itemIndex) {
                videoViewerControllerList[itemIndex].play();
              }
            } catch (e) {
              print("Error is the ${e.toString()}");
            }
          },
          child: DirectVideoViewer(
            url: post.file.replaceAll(' ', '%20'),
            itemIndex: itemIndex,
            currentIndex: swipableStackController.currentIndex,
            isPlay: isPlay.value,
            visibility: videoVisibilityPercent.value,
          ),
        );
      default:
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(
                  images[0],
                ),
                fit: BoxFit.cover,
              )),
        );
    }
  }
}
