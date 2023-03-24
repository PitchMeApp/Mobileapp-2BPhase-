import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pitch_me_app/models/statisticsModel/statisticsModel.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';
import 'package:pitch_me_app/utils/widgets/text/text.dart';

class StatisticsPage_Two extends StatelessWidget {
  const StatisticsPage_Two(
      {Key? key, required this.pagecont, required this.statisticsModel})
      : super(key: key);
  final PageController pagecont;
  final StatisticsModel statisticsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: Stack(
          children: [
            Column(
              children: [
                spaceHeight(SizeConfig.getSize60(context: context)),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              pagecont.previousPage(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.linear);
                            },
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: /* SvgPicture.asset(Assets.tiktokPreviousIco),*/
                                    RotatedBox(
                                  quarterTurns: 6,
                                  child: Image.asset(
                                    "assets/Phase 2 icons/ic_keyboard_arrow_down_24px.png",
                                    color: Color(0xff377EB4),
                                    height:
                                        SizeConfig.getSize35(context: context),
                                    width:
                                        SizeConfig.getSize35(context: context),
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
      ),
    );
  }

  Widget continentCount(BuildContext context) {
    return Container(
      // height: Get.height * 0.1,
      // width: Get.width * 0.7,
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.getSize60(context: context),
          vertical: SizeConfig.getSize10(context: context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getSize15(context: context),
            vertical: SizeConfig.getSize15(context: context)),
        child: Container(
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    roboto(
                        size: SizeConfig.getFontSize14(context: context),
                        text: 'Cities',
                        color: colors.black,
                        fontWeight: FontWeight.w400),
                    spaceHeight(5),
                    roboto(
                        size: SizeConfig.getFontSize19(context: context),
                        text: '${statisticsModel.result!.cities!.number}',
                        fontWeight: FontWeight.w800,
                        color: colors.bannerColor),
                  ],
                ),
                VerticalDivider(
                  thickness: 1,
                  color: colors.black,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    roboto(
                        size: SizeConfig.getFontSize14(context: context),
                        text: 'Countries',
                        color: colors.black,
                        fontWeight: FontWeight.w400),
                    spaceHeight(SizeConfig.getSize10(context: context)),
                    roboto(
                        size: SizeConfig.getFontSize19(context: context),
                        text: '${statisticsModel.result!.countries!.number}',
                        fontWeight: FontWeight.w800,
                        color: colors.bannerColor),
                  ],
                ),
                VerticalDivider(
                  thickness: 1,
                  color: colors.black,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    roboto(
                        size: SizeConfig.getFontSize14(context: context),
                        text: 'Continent',
                        color: colors.black,
                        fontWeight: FontWeight.w400),
                    spaceHeight(SizeConfig.getSize10(context: context)),
                    roboto(
                        size: SizeConfig.getFontSize19(context: context),
                        text: '${statisticsModel.result!.continents!.number}',
                        fontWeight: FontWeight.w800,
                        color: colors.bannerColor),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appStatistics({required BuildContext context}) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: sizeH * 0.015),
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
            margin: EdgeInsets.only(bottom: sizeH * 0.015),
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
            margin: EdgeInsets.only(bottom: sizeH * 0.015),
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
            margin: EdgeInsets.only(bottom: sizeH * 0.015),
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
            margin: EdgeInsets.only(bottom: sizeH * 0.015),
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
            margin: EdgeInsets.only(bottom: sizeH * 0.015),
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
            margin: EdgeInsets.only(bottom: sizeH * 0.015),
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
            margin: EdgeInsets.only(bottom: sizeH * 0.015),
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
