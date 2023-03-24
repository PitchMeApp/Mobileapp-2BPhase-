import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pitch_me_app/utils/strings/images.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class Email_screen extends StatefulWidget {
  const Email_screen({super.key});

  @override
  State<Email_screen> createState() => _Email_screenState();
}

class _Email_screenState extends State<Email_screen> {
  var rating = 0.0;
  var rating_Two = 0.0;
  bool selectbutton = false;
  bool selectbutton_Two = false;

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
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
        SizedBox(
          height: sizeH * 0.06,
        ),
        Container(
            child: Padding(
          padding: EdgeInsets.only(left: sizeW * 0.02, right: sizeW * 0.02),
          child: Image.asset(
            "assets/image/Group 12261.png",
            height: sizeH * 0.13,
          ),
        )),
        SizedBox(
          height: sizeH * 0.05,
        ),
        Text(
          "A confirmation link has been",
          style: TextStyle(
              fontSize: sizeH * 0.027,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Color(0xff377EB4)),
        ),
        Text(
          "sent to your Email.",
          style: TextStyle(
              fontSize: sizeH * 0.027,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Color(0xff377EB4)),
        ),
        SizedBox(
          height: sizeH * 0.05,
        ),
        Text(
          "If you can't find it Check ",
          style: TextStyle(
              fontSize: sizeH * 0.027,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Color(0xff377EB4)),
        ),
        Text(
          "Junk/Spam Box",
          style: TextStyle(
              fontSize: sizeH * 0.027,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Color(0xff377EB4)),
        ),
      ]),
    ));
  }
}
