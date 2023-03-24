import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/controller/auth/loginController.dart';
import 'package:pitch_me_app/controller/auth/signupController.dart';
import 'package:pitch_me_app/screens/auth/linkSentScreen.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';
import 'package:pitch_me_app/utils/strings/images.dart';
import 'package:pitch_me_app/utils/strings/strings.dart';
import 'package:pitch_me_app/utils/widgets/containers/containers.dart';
import 'package:pitch_me_app/utils/widgets/extras/backgroundWidget.dart';
import 'package:pitch_me_app/utils/widgets/extras/banner.dart';
import 'package:pitch_me_app/utils/widgets/extras/checkBox.dart';
import 'package:pitch_me_app/utils/widgets/text/text.dart';
import 'package:pitch_me_app/utils/widgets/textFields/textField.dart';

import 'loginScreen.dart';

class SignUpScreen extends GetView<SignupController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackGroundWidget(
        backgroundImage: Assets.backgroundImage,
        bannerRequired: false,
        fit: BoxFit.fill,
        child: Stack(
          children: [
            SingleChildScrollView(
              reverse: true,
              padding: EdgeInsets.zero,
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
                  Padding(
                    padding: SizeConfig.leftRightPadding(context),
                    child: Column(
                      children: [
                        spaceHeight(20),
                        new CustomTextField(
                          controller: controller.txtEmail,
                          lableText: EMAIL,
                          context: context,
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          focusNode: controller.emailNode,
                          nextFocusNode: controller.userNameNode,
                        ),
                        spaceHeight(SizeConfig.getSize20(context: context)),
                        new CustomTextField(
                          lableText: USERNAME,
                          context: context,
                          controller: controller.txtUserName,
                          inputAction: TextInputAction.next,
                          focusNode: controller.userNameNode,
                          nextFocusNode: controller.passwordNode,
                        ),
                        spaceHeight(SizeConfig.getSize20(context: context)),
                        new CustomTextField(
                          lableText: PASSWORD,
                          obscure: true,
                          context: context,
                          controller: controller.txtPassword,
                          inputAction: TextInputAction.next,
                          focusNode: controller.passwordNode,
                          nextFocusNode: controller.confirmPasswordNode,
                        ),
                        spaceHeight(SizeConfig.getSize20(context: context)),
                        new CustomTextField(
                          lableText: CONFIRMPASSWORD,
                          obscure: true,
                          context: context,
                          controller: controller.txtConfirmPassword,
                          inputAction: TextInputAction.done,
                          onFieldSubmit: () {
                            controller.submit();
                          },
                          focusNode: controller.confirmPasswordNode,
                        ),
                        spaceHeight(SizeConfig.getSize30(context: context)),
                        buttonContainer(
                            height: 48,
                            onTap: () {
                              controller.submit();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [roboto(size: 20, text: REGISTER)],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ALREADYREGISTERED,
                              style: TextStyle(
                                color: colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    SizeConfig.getFontSize14(context: context),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Get.to(() => LoginScreen(),
                                //     binding: LoginBinding());
                                Get.back();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: SizeConfig.getSize20(context: context),
                                    bottom:
                                        SizeConfig.getSize20(context: context),
                                    left: SizeConfig.getSize5(context: context),
                                    right:
                                        SizeConfig.getSize20(context: context)),
                                child: Text(LOGIN,
                                    style: TextStyle(
                                        color: colors.white,
                                        fontSize: SizeConfig.getFontSize14(
                                            context: context),
                                        fontWeight: FontWeight.w800)),
                              ),
                            ),
                          ],
                        ),
//                         RichText(
//                             text: TextSpan(
//                                 style: TextStyle(
//                                   color: colors.white,
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: SizeConfig.getFontSize14(
//                                       context: context),
//                                 ),
//                                 children: [
//                               const TextSpan(
//                                 text: ALREADYREGISTERED,
//                               ),
//                               TextSpan(
//                                 text: LOGIN,
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {
// //                                  AppRoutes.navigateOffLoign();
//                                     Get.offAll(() => LoginScreen(),
//                                         binding: LoginBinding());
//                                   },
//                                 style: const TextStyle(
//                                     color: colors.white,
//                                     fontWeight: FontWeight.w800),
//                               ),
//                             ])),
                        spaceHeight(SizeConfig.getSize20(context: context)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.agree.value =
                                    !controller.agree.value;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Obx(
                                    () => myCheckBox(controller.agree.value)),
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.getFontSize14(
                                        context: context),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: AGREE_TO),
                                    TextSpan(
                                        text: TERMS_CONDITIONS,
                                        style: TextStyle(
                                            color: colors.white,
                                            fontSize: SizeConfig.getFontSize14(
                                                context: context),
                                            fontWeight: FontWeight.w800),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print('Terms of Service"');
                                          }),
                                    TextSpan(text: ' and '),
                                    TextSpan(
                                        text: COOKIES_USE,
                                        style: TextStyle(
                                            color: colors.white,
                                            fontSize: SizeConfig.getFontSize14(
                                                context: context),
                                            fontWeight: FontWeight.w800),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print('Privacy Policy"');
                                          }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom == 0
                              ? 0
                              : SizeConfig.getSizeHeightBy(
                                  context: context, by: 0.27)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
