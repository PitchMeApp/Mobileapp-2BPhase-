import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/controller/businessIdeas/homepagecontroller.dart';
import 'package:pitch_me_app/screens/auth/signUpScreen.dart';

import '../../controller/auth/signupController.dart';

class swipeContinue extends StatefulWidget {
  const swipeContinue({super.key});

  @override
  State<swipeContinue> createState() => _swipeContinueState();
}

class _swipeContinueState extends State<swipeContinue> {
  bool selectbutton = false;
  bool selectbutton_Two = false;

  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Column(
      children: [
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
        Padding(
          padding: EdgeInsets.only(left: sizeW * 0.67, top: sizeH * 0.01),
          child: InkWell(
            onTap: () {
              ////Close///
              ///
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => loggedSwitch()));
              controller.PageIndexData.value = 0;
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Floatbar(0)));
            },
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff377EB4),
                ),
                height: sizeH * 0.05,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                )),
          ),
        ),
        SizedBox(
          height: sizeH * 0.02,
        ),
        Text(
          "Only User Logged in as",
          style: TextStyle(
              fontSize: sizeH * 0.028,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Color(0xff377EB4)),
        ),
        Text(
          "Business Owner Or Business",
          style: TextStyle(
              fontSize: sizeH * 0.028,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Color(0xff377EB4)),
        ),
        Text(
          "Idea can Add a Sales Pitch",
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
                });
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => SelectionScreen()));
                // setState(() {
                //   selectbutton = false;
                // });
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
                    SvgPicture.asset("assets/Phase 2 icons/ic_repeat_24px.svg"),
                    SizedBox(
                      width: sizeW * 0.015,
                    ),
                    Text(
                      "Switch",
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
                Get.to(() => SignUpScreen(), binding: SignUpBinding());
                setState(() {
                  selectbutton_Two = false;
                });
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
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
                    Icon(
                      Icons.person_add,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: sizeW * 0.015,
                    ),
                    Text(
                      "Sign up",
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
