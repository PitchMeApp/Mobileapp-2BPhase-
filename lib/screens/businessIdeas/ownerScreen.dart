import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/models/statisticsModel/statisticsModel.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';
import 'package:pitch_me_app/utils/strings/images.dart';
import 'package:pitch_me_app/utils/widgets/text/text.dart';

class ownerPage extends StatelessWidget {
  ownerPage({
    Key? key,
  }) : super(key: key);

  PageController? _controller;
  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Padding(
                              padding: EdgeInsets.only(top: sizeH * 0.05),
                              child: /* SvgPicture.asset(Assets.tiktokPreviousIco),*/
                                  RotatedBox(
                                quarterTurns: 6,
                                child: Image.asset(
                                  "assets/Phase 2 icons/ic_keyboard_arrow_down_24px.png",
                                  color: Color(0xff377eb4),
                                  height:
                                      SizeConfig.getSize35(context: context),
                                  width: SizeConfig.getSize35(context: context),
                                ),
                              )),
                        ),
                      ],
                    ),
                    Expanded(child: appStatistics(context: context)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget appStatistics({required BuildContext context}) {
    List ownerImage = [
      "assets/Phase 2 icons/industry.png",
      "assets/Phase 2 icons/place.png",
      "assets/Phase 2 icons/local atm.png",
      "assets/Phase 2 icons/monetization.png",
      "assets/Phase 2 icons/Group.png",
      "assets/Phase 2 icons/content paste.png",
      "assets/Phase 2 icons/check circle.png",
      "",
    ];

    List<String> ownerTitle = [
      "Air Transportation",
      "New jersey, USA",
      "Investor",
      "70.000 Usd",
      "Facilitator",
      "Service",
      "App Developer",
      "every 10.00 usd"
    ];

    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: sizeH * 0.02),
            width: sizeW * 0.85,
            height: sizeH * 0.068,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff377EB4),
            ),
            child: ListTile(
                leading: Image.asset("assets/Phase 2 icons/industry.png",
                    height: sizeH * 0.04),
                title: Text(
                  "Air Transportation",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: sizeH * 0.02),
            width: sizeW * 0.85,
            height: sizeH * 0.068,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff377EB4),
            ),
            child: ListTile(
                leading: Image.asset("assets/Phase 2 icons/place.png",
                    height: sizeH * 0.04),
                title: Text(
                  "New jersey, USA",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: sizeH * 0.02),
            width: sizeW * 0.85,
            height: sizeH * 0.068,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff377EB4),
            ),
            child: ListTile(
                leading: Image.asset("assets/Phase 2 icons/local atm.png",
                    height: sizeH * 0.04),
                title: Text(
                  "Investor",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: sizeH * 0.02),
            width: sizeW * 0.85,
            height: sizeH * 0.068,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff377EB4),
            ),
            child: ListTile(
                leading: Image.asset("assets/Phase 2 icons/monetization.png",
                    height: sizeH * 0.04),
                title: Text(
                  "70.000 Usd",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: sizeH * 0.02),
            width: sizeW * 0.85,
            height: sizeH * 0.068,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff377EB4),
            ),
            child: ListTile(
                leading: Image.asset("assets/Phase 2 icons/Group.png",
                    height: sizeH * 0.04),
                title: Text(
                  "Facilitator",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: sizeH * 0.02),
            width: sizeW * 0.85,
            height: sizeH * 0.068,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff377EB4),
            ),
            child: ListTile(
                leading: Image.asset("assets/Phase 2 icons/content paste.png",
                    height: sizeH * 0.04),
                title: Text(
                  "Service",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: sizeH * 0.02),
            width: sizeW * 0.85,
            height: sizeH * 0.068,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff377EB4),
            ),
            child: ListTile(
                leading: Image.asset("assets/Phase 2 icons/check circle.png",
                    height: sizeH * 0.04),
                title: Text(
                  "App Developer",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: sizeH * 0.02),
            width: sizeW * 0.85,
            height: sizeH * 0.068,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff377EB4),
            ),
            child: ListTile(
                leading: Text(""),
                title: AutoSizeText(
                  "every 10.00 usd = 5% Ownership. Above 50.000 usd also 3% \nroyalties",
                  maxLines: 2,
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    image: DecorationImage(
                        image:
                            AssetImage("assets/Phase 2 icons/Path 2681.png"))),
                margin: EdgeInsets.only(right: 20),
                height: sizeH * 0.18,
                width: sizeW * 0.4,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/Phase 2 icons/Rectangle 2277.png"))),
                height: sizeH * 0.18,
                width: sizeW * 0.4,
              )
            ],
          )
        ],
      )),
    );
  }
}
