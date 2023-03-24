import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/models/statisticsModel/statisticsModel.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';
import 'package:pitch_me_app/utils/strings/images.dart';
import 'package:pitch_me_app/utils/widgets/text/text.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage(
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
        decoration: BoxDecoration(color: Color(0xff377EB4)),
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
                                  padding: EdgeInsets.all(
                                      SizeConfig.getSize15(context: context)),
                                  child: /* SvgPicture.asset(Assets.tiktokPreviousIco),*/
                                      RotatedBox(
                                    quarterTurns: 6,
                                    child: Image.asset(
                                      "assets/Phase 2 icons/ic_keyboard_arrow_down_24px.png",
                                      height: SizeConfig.getSize35(
                                          context: context),
                                      width: SizeConfig.getSize35(
                                          context: context),
                                    ),
                                  ))),
                        ],
                      ),
                      appStatistics(context: context),
                      spaceHeight(25),
                      SizedBox(
                          height: Get.height * 0.30,
                          width: Get.width,
                          child: SvgPicture.asset(Assets.mapIco)),
                      spaceHeight(25),
                      continentCount(context),
                      Spacer(),
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
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getSize35(context: context),
          vertical: SizeConfig.getSize15(context: context)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.getSize15(context: context)),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width(context) * 0.35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          roboto(
                              size: SizeConfig.getFontSize14(context: context),
                              text: 'Investors',
                              color: colors.black,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w400),
                          spaceHeight(SizeConfig.getSize10(context: context)),
                          roboto(
                              size: SizeConfig.getFontSize19(context: context),
                              text:
                                  '${statisticsModel.result!.investors!.number}',
                              fontWeight: FontWeight.w800,
                              color: colors.black),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      thickness: 1,
                      color: colors.black,
                    ),
                    Container(
                      width: width(context) * 0.36,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          roboto(
                              size: SizeConfig.getFontSize14(context: context),
                              text: 'Businesses',
                              color: colors.black,
                              fontWeight: FontWeight.w400),
                          spaceHeight(SizeConfig.getSize10(context: context)),
                          roboto(
                              size: SizeConfig.getFontSize19(context: context),
                              text:
                                  '${statisticsModel.result!.business!.number}',
                              fontWeight: FontWeight.w800,
                              color: colors.black),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              spaceHeight(SizeConfig.getSize20(context: context)),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width(context) * 0.35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          roboto(
                              size: SizeConfig.getFontSize14(context: context),
                              text: 'Raised Funds',
                              color: colors.black,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400),
                          spaceHeight(SizeConfig.getSize10(context: context)),
                          roboto(
                              size: SizeConfig.getFontSize19(context: context),
                              text:
                                  '${statisticsModel.result!.raisedFunds!.number} USD',
                              fontWeight: FontWeight.w800,
                              textAlign: TextAlign.start,
                              color: colors.black),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      thickness: 1,
                      color: colors.black,
                    ),
                    Container(
                      width: width(context) * 0.36,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          roboto(
                              size: SizeConfig.getFontSize14(context: context),
                              text: 'Verified Funds',
                              color: colors.black,
                              fontWeight: FontWeight.w400),
                          spaceHeight(SizeConfig.getSize10(context: context)),
                          roboto(
                              size: SizeConfig.getFontSize19(context: context),
                              text:
                                  '${statisticsModel.result!.verifiedFunds!.number} USD',
                              fontWeight: FontWeight.w800,
                              textAlign: TextAlign.start,
                              color: colors.black),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
