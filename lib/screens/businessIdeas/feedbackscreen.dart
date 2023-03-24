import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/controller/businessIdeas/postPageController.dart';
import 'package:pitch_me_app/screens/businessIdeas/Feedbackapi.dart/postapi.dart';
import 'package:pitch_me_app/screens/businessIdeas/swipeContinue.dart';
import 'package:pitch_me_app/utils/strings/images.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:swipable_stack/swipable_stack.dart';

class ratingScreen extends StatefulWidget {
  ratingScreen({
    super.key,
  });

  @override
  State<ratingScreen> createState() => _ratingScreenState();
}

class _ratingScreenState extends State<ratingScreen> {
  final formkey = GlobalKey<FormState>();
  var rating = 0.0;
  var rating_Two = 0.0;
  bool selectbutton = false;
  bool selectbutton_Two = false;

  PostPageController _pageController = Get.put(PostPageController());

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    _pageController.notVideo = true;

    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(children: [
          SizedBox(
            height: sizeH * 0.1,
          ),
          Image.asset(
            "assets/image/Group 12262.png",
            height: sizeH * 0.1,
          ),
          SizedBox(
            height: sizeH * 0.065,
          ),
          Image.asset(
            "assets/image/Group 12261.png",
            height: sizeH * 0.13,
          ),
          SizedBox(
            height: sizeH * 0.01,
          ),
          Text(
            " Please give Feedback so that ",
            style: TextStyle(
                fontSize: sizeH * 0.027,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: Color(0xff377EB4)),
          ),
          Text(
            "they can improve:",
            style: TextStyle(
                fontSize: sizeH * 0.027,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: Color(0xff377EB4)),
          ),
          SizedBox(
            height: sizeH * 0.017,
          ),
          Center(
            child: Text(
              "The Business",
              style: TextStyle(
                  fontSize: sizeH * 0.016,
                  letterSpacing: 0.5,
                  color: Color(0xff377EB4)),
            ),
          ),
          SizedBox(
            height: sizeH * 0.013,
          ),
          SmoothStarRating(
              allowHalfRating: false,
              onRatingChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
              starCount: 5,
              rating: rating,
              size: 40.0,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_border,
              color: Color(0xff377EB4),
              borderColor: Color(0xff377EB4),
              spacing: 0.0),
          SizedBox(
            height: sizeH * 0.015,
          ),
          Center(
            child: Text(
              "The Sales Pitch",
              style: TextStyle(
                  fontSize: sizeH * 0.016,
                  letterSpacing: 0.5,
                  color: Color(0xff377EB4)),
            ),
          ),
          SizedBox(
            height: sizeH * 0.013,
          ),
          SmoothStarRating(
              allowHalfRating: false,
              onRatingChanged: (value) {
                setState(() {
                  rating_Two = value;
                });
              },
              starCount: 5,
              rating: rating_Two,
              size: 40.0,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_border,
              color: Color(0xff377EB4),
              borderColor: Color(0xff377EB4),
              spacing: 0.0),
          SizedBox(
            height: sizeH * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: sizeW * 0.035, right: sizeW * 0.035),
            child: TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color(0xff377EB4),
                      width: 2,
                    )),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color(0xff377EB4),
                      width: 2,
                    )),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please give feedback';
                }
              },
            ),
          ),
          SizedBox(
            height: sizeH * 0.02,
          ),
          InkWell(
            onTap: () {
              print("tapped on");

              final isvalidation = formkey.currentState!.validate();

              print(" rating star ${rating_Two}");

              ///
              /// Sign Up
              ///

              if (isvalidation && rating_Two != 0.0 && rating != 0.0) {
                postfeedback();
                // _pageController.swipableStackController
                //     .next(swipeDirection: SwipeDirection.left);
                // setState(() {
                //   _pageController.left = false;
                // });
              } else {
                Fluttertoast.showToast(
                    msg: "please give star",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0);
                selectbutton = true;
              }
            },
            child: Container(
              height: sizeH * 0.045,
              width: sizeW * 0.26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selectbutton ? Color(0xff000c61) : Color(0xff377EB4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: sizeW * 0.015,
                  ),
                  Text(
                    "Ok",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
