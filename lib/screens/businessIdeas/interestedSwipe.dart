import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/controller/businessIdeas/postPageController.dart';
import 'package:pitch_me_app/utils/strings/images.dart';
import 'package:swipable_stack/swipable_stack.dart';

class interestedSwipe extends StatefulWidget {
  const interestedSwipe({super.key});

  @override
  State<interestedSwipe> createState() => _interestedSwipeState();
}

class _interestedSwipeState extends State<interestedSwipe> {
  bool selectbutton = false;
  bool selectbutton_Two = false;

  PostPageController _pageController = Get.put(PostPageController());

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    _pageController.notVideo = true;

    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: sizeH * 0.05,
        ),
        SafeArea(
          child: Container(
              child: Padding(
            padding: EdgeInsets.only(left: sizeW * 0.02, right: sizeW * 0.02),
            child: Center(
              child: Image.asset(
                "assets/image/Group 12262.png",
                height: sizeH * 0.13,
              ),
            ),
          )),
        ),
        Container(
            child: Padding(
          padding: EdgeInsets.only(left: sizeW * 0.02, right: sizeW * 0.02),
          child: Image.asset(
            "assets/image/Group 12261.png",
            height: sizeH * 0.13,
          ),
        )),
        // Padding(
        //   padding: EdgeInsets.only(left: sizeW * 0.67, top: sizeH * 0.01),
        //   child: InkWell(
        //     onTap: () {
        //       ////Close///
        //       ///
        //       // Navigator.push(context,
        //       //     MaterialPageRoute(builder: (context) => loggedSwitch()));
        //     },
        //     child: Container(
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: Color(0xff377EB4),
        //         ),
        //         height: sizeH * 0.05,
        //         child: Icon(
        //           Icons.close,
        //           color: Colors.white,
        //         )),
        //   ),
        // ),
        SizedBox(
          height: sizeH * 0.02,
        ),
        Text(
          "Would you like to continue ",
          style: TextStyle(
              fontSize: sizeH * 0.028,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Color(0xff377EB4)),
        ),
        Text(
          "watching Sales Pitches or ",
          style: TextStyle(
              fontSize: sizeH * 0.028,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Color(0xff377EB4)),
        ),
        Text(
          "Start Chat with this one?",
          style: TextStyle(
              fontSize: sizeH * 0.028,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Color(0xff377EB4)),
        ),
        SizedBox(
          height: sizeH * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ///Switch////
            InkWell(
              onTap: () {
                ///
                setState(() {
                  selectbutton = true;
                  // Duration(seconds: 0);
                  _pageController.swipableStackController.next(
                      swipeDirection: SwipeDirection.right,
                      duration: Duration(seconds: 0));
                });
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
                    SvgPicture.asset(
                        "assets/Phase 2 icons/ic_forward_24px.svg"),
                    SizedBox(
                      width: sizeW * 0.015,
                    ),
                    Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),

            ////Sign Up////
            InkWell(
              onTap: () {
                setState(() {
                  selectbutton_Two = true;
                });
              },
              child: Container(
                height: sizeH * 0.045,
                width: sizeW * 0.26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      selectbutton_Two ? Color(0xff000c61) : Color(0xff377EB4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        "assets/Phase 2 icons/ic_question_ans.svg"),
                    SizedBox(
                      width: sizeW * 0.015,
                    ),
                    Text(
                      "Chat",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
