import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/controller/selectionController.dart';
import 'package:pitch_me_app/core/extras.dart';
import 'package:pitch_me_app/screens/businessIdeas/mainHome.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';
import 'package:pitch_me_app/utils/strings/images.dart';
import 'package:pitch_me_app/utils/strings/strings.dart';
import 'package:pitch_me_app/utils/widgets/containers/containers.dart';
import 'package:pitch_me_app/utils/widgets/extras/backgroundWidget.dart';
import 'package:pitch_me_app/utils/widgets/text/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectionScreen extends GetView<SelectionController> {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool SectionData = false;

    print("DataFully Loaded");
    return Scaffold(
      body: BackGroundWidget(
          imagebottom: true,
          fit: BoxFit.fitHeight,
          backgroundImage: Assets.backgroundImage2,
          child: Container(
            width: width(context),
            padding: EdgeInsets.zero,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  spaceHeight(
                      SizeConfig.getSizeHeightBy(context: context, by: 0.02)),
                  Padding(
                    padding: SizeConfig.leftRightPadding(context),
                    child: appLogoImage(
                        width: width(context) * 0.5,
                        isDark: false,
                        height: SizeConfig.getSizeHeightBy(
                            context: context, by: 0.13)),
                  ),
                  spaceHeight(SizeConfig.getSize15(context: context)),
                  buttonContainer(
                      height:
                          SizeConfig.getSizeWidthBy(context: context, by: 0.25),
                      width:
                          SizeConfig.getSizeWidthBy(context: context, by: 0.25),
                      cornerRadius: 25,
                      onTap: () async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();

                        SectionData = true;
                        preferences.setBool('sectionbool', SectionData);
                        print(
                            " ABCD bool ${preferences.setBool('sectionbool', SectionData)}");
                        controller.submit(1);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(
                            SizeConfig.getSize25(context: context)),
                        child: loadSvg(
                            image: Assets.businessIdeaIco, color: Colors.white),
                      )),
                  spaceHeight(SizeConfig.getSize15(context: context)),
                  roboto(
                      size: SizeConfig.getFontSize16(context: context),
                      text: BUSINESSIDEA,
                      fontWeight: FontWeight.w800,
                      color: colors.white),
                  spaceHeight(SizeConfig.getSize25(context: context)),
                  buttonContainer(
                      height:
                          SizeConfig.getSizeWidthBy(context: context, by: 0.25),
                      width:
                          SizeConfig.getSizeWidthBy(context: context, by: 0.25),
                      cornerRadius: 25,
                      onTap: () {
                        controller.submit(2);
                        SectionData = true;
                      },
                      child: Padding(
                        padding: EdgeInsets.all(
                            SizeConfig.getSize25(context: context)),
                        child: loadSvg(
                            image: Assets.businessOwnerIco,
                            color: colors.white),
                      )),
                  spaceHeight(SizeConfig.getSize15(context: context)),
                  roboto(
                      size: SizeConfig.getFontSize16(context: context),
                      text: BUSINESSOWNER,
                      fontWeight: FontWeight.w800,
                      color: colors.white),
                  spaceHeight(SizeConfig.getSize25(context: context)),
                  buttonContainer(
                      height:
                          SizeConfig.getSizeWidthBy(context: context, by: 0.25),
                      width:
                          SizeConfig.getSizeWidthBy(context: context, by: 0.25),
                      cornerRadius: 25,
                      onTap: () {
                        controller.submit(3);
                        SectionData = false;
                      },
                      child: Padding(
                        padding: EdgeInsets.all(
                            SizeConfig.getSize25(context: context)),
                        child: loadSvg(
                            image: Assets.investorIco, color: colors.white),
                      )),
                  spaceHeight(SizeConfig.getSize15(context: context)),
                  roboto(
                      size: SizeConfig.getFontSize16(context: context),
                      text: INVESTOR,
                      fontWeight: FontWeight.w800,
                      color: colors.white),
                  spaceHeight(SizeConfig.getSize25(context: context)),
                  buttonContainer(
                      height:
                          SizeConfig.getSizeWidthBy(context: context, by: 0.25),
                      width:
                          SizeConfig.getSizeWidthBy(context: context, by: 0.25),
                      cornerRadius: 25,
                      onTap: () {
                        controller.submit(4);
                        SectionData = false;
                      },
                      child: Padding(
                          padding: EdgeInsets.all(
                              SizeConfig.getSize25(context: context)),
                          child: SvgPicture.asset(
                              "assets/Phase 2 icons/ic_vpn_key_24px.svg"))),
                  spaceHeight(SizeConfig.getSize15(context: context)),
                  roboto(
                      size: SizeConfig.getFontSize16(context: context),
                      text: "Facilitator",
                      fontWeight: FontWeight.w800,
                      color: colors.white),
                  // buttons(AppString.businessIdea, AppAssets.businessIdeaIco,
                  //     () {
                  //   AppRoutes.navigateOffDashboard();
                  // }),
                  // SizedBox(
                  //   height: Get.height * 0.03,
                  // ),
                  // buttons(AppString.businessOwner, AppAssets.businessOwnerIco,
                  //     () {
                  //   // AppRoutes.navigateOffHomePage();
                  // }),
                  // SizedBox(
                  //   height: Get.height * 0.03,
                  // ),
                  // buttons(AppString.investor, AppAssets.investorIco, () {}),
                  // SizedBox(
                  //   height: Get.height * 0.03,
                  // ),
                  // buttons(AppString.partner, AppAssets.partnerIco, () {}),
                ],
              ),
            ),
          )),
    );
  }
//
// Widget buttons(String name, String icon, Function() onPressed) {
//   return ModuleSelectionPushButton(
//       icon: icon, name: name, onPressed: onPressed);
// }
}
