import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/controller/auth/loginController.dart';
import 'package:pitch_me_app/controller/auth/signupController.dart';
import 'package:pitch_me_app/screens/selectionScreen.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';
import 'package:pitch_me_app/utils/strings/images.dart';
import 'package:pitch_me_app/utils/strings/strings.dart';
import 'package:pitch_me_app/utils/widgets/containers/containers.dart';
import 'package:pitch_me_app/utils/widgets/extras/backgroundWidget.dart';
import 'package:pitch_me_app/utils/widgets/extras/banner.dart';
import 'package:pitch_me_app/utils/widgets/text/text.dart';
import 'package:pitch_me_app/utils/widgets/textFields/textField.dart';

import 'loginScreen.dart';

class LinkSentScreen extends GetView<SignupController> {
  const LinkSentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackGroundWidget(
        backgroundImage: Assets.backgroundImage,
        bannerRequired: true,
        fit: BoxFit.fill,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    spaceHeight(
                        SizeConfig.getSizeHeightBy(context: context, by: 0.02)),
                    Padding(
                      padding: SizeConfig.leftRightPadding(context),
                      child: appLogoImage(
                          width: width(context) * 0.5,
                          height: SizeConfig.getSizeHeightBy(
                              context: context, by: 0.13)),
                    ),
                    spaceHeight(SizeConfig.getSize10(context: context)),
                    whiteBorderContainer(
                        child: Image.asset(Assets.handshakeImage),
                        height: SizeConfig.getSizeHeightBy(
                            context: context, by: 0.15),
                        width: SizeConfig.getSizeHeightBy(
                            context: context, by: 0.15),
                        cornerRadius: 25),
                  ],
                ),
              ],
            ),
            Positioned.fill(child: Container(color: Color(0xccffffff))),
            Padding(
              padding: SizeConfig.leftRightPadding(context),
              child: Column(
                children: [
                  Spacer(),
                  spaceHeight(80),
                  inter(
                      size: SizeConfig.getFontSize18(context: context),
                      text: CONFIRMATION_LINK_SENT,
                      textAlign: TextAlign.center,
                      color: colors.bannerColor),
                  Spacer(),
                  Column(
                    children: [
                      spaceHeight(SizeConfig.getSize10(context: context)),
                      // InkWell(
                      //   onTap: () {
                      //     Get.offAll(() => LoginScreen(),
                      //         binding: LoginBinding());
                      //   },
                      //   child: Text.rich(
                      //     TextSpan(
                      //       style: TextStyle(
                      //         fontFamily: 'Proxima Nova',
                      //         fontSize:
                      //             SizeConfig.getFontSize16(context: context),
                      //         color: const Color(0xff000c61),
                      //         height: 1.125,
                      //       ),
                      //       children: [
                      //         TextSpan(
                      //           text: 'Click here to ',
                      //         ),
                      //         TextSpan(
                      //           text: 'Log In',
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.w700,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     textHeightBehavior: TextHeightBehavior(
                      //         applyHeightToFirstAscent: false),
                      //     textAlign: TextAlign.left,
                      //   ),
                      // ),
                      spaceHeight(50),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
