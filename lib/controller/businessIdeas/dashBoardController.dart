import 'dart:developer';

import 'package:get/get.dart';
import 'package:pitch_me_app/core/apis/postScreenApi.dart';
import 'package:pitch_me_app/models/post/postModel.dart';
import 'package:pitch_me_app/models/statisticsModel/statisticsModel.dart';

class DashboardController extends GetxController {
  BusinessIdeasApi businessIdeasApi = BusinessIdeasApi();
  var postModel = PostModel().obs,
      hasError = false.obs,
      staticModel = StatisticsModel().obs,
      visibleSaveSeen = false.obs,
      isLoadingPost = false.obs,
      isLoadingStats = false.obs,
      isFinish = false.obs;

  getPost(Function(int index, String title, bool isFinish) onSwipe) async {
    try {
      isLoadingPost.value = true;
      hasError.value = false;
      await businessIdeasApi.getPost().then((value) {
        if (value != null) {
          postModel.value = value;
          //log('Video check =' + value.result!.length.toString());
          isLoadingPost.value = false;
          //log('Video check 1 =' + postModel.value.result![0].toString());
          onSwipe(0, postModel.value.result![0].title!.toString(), false);
          //log('Video check4 =' + value.result!.length.toString());
          //log("PostModel in value ${postModel.value.result![0].text.toString()}");
        } else {
          // log('Video check 2 =' + value!.result!.length.toString());
          hasError.value = true;
        }
      });
    } catch (e) {
      log("Error at get post is ${e.toString()}");
      isLoadingPost.value = false;
      hasError.value = true;
    }
  }

  getStatic() async {
    try {
      isLoadingStats.value = true;
      await businessIdeasApi.getStatistics().then((value) {
        isLoadingStats.value = false;
        if (value != null) {
          staticModel.value = value;
        } else {}
      });
    } catch (e) {
      print("Error at get post is ${e.toString()}");
      isLoadingStats.value = false;
    }
  }
}
