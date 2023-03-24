import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pitch_me_app/models/FeedbackModel.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../../controller/businessIdeas/postPageController.dart';
import '../../../core/urls.dart';

PostPageController _pageController = Get.put(PostPageController());

Future<FeedbackModel?> postfeedback() async {
  try {
    var response = await http.post(
      Uri.parse(BASE_URL + "feedback/add"),
      body: jsonEncode({
        "senderid": "636cc28ec626aa5278f266e7",
        "receiverid": "636cc8bac626aa5278f26728",
        "postid": "638243f3eb71b5ea4d377840",
        "star": 4,
        "videoStar": 5,
        "description": "nice video"
      }),
      headers: {'Content-Type': "application/json"},
    );

    var data = response.body;
    print("dataa ${data}");

    if (response.statusCode == 200 || response.statusCode == 202) {
      print('successfully logged');

      Fluttertoast.showToast(
          msg: "Feedback given Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
      _pageController.swipableStackController
          .next(swipeDirection: SwipeDirection.left);
      // _pageController.left = false;
      return feedbackModelFromJson(data);
      // Navigator.pop(context);
    } else {
      print('login failed');
      return null;
    }
  } catch (e) {
    print(e.toString());
  }
}
