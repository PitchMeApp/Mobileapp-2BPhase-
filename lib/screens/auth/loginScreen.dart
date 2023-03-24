import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/controller/auth/forgotpasswordController.dart';
import 'package:pitch_me_app/controller/auth/loginController.dart';
import 'package:pitch_me_app/controller/auth/signupController.dart';
import 'package:pitch_me_app/screens/auth/forgotPassword.dart';
import 'package:pitch_me_app/screens/auth/signUpScreen.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';
import 'package:pitch_me_app/utils/strings/images.dart';
import 'package:pitch_me_app/utils/strings/strings.dart';
import 'package:pitch_me_app/utils/widgets/containers/containers.dart';
import 'package:pitch_me_app/utils/widgets/extras/backgroundWidget.dart';
import 'package:pitch_me_app/utils/widgets/text/text.dart';
import 'package:pitch_me_app/utils/widgets/textFields/textField.dart';

class LoginScreen extends GetResponsiveView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);
  bool emailFocus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackGroundWidget(
        bannerRequired: false,
        backgroundImage: Assets.backgroundImage,
        fit: BoxFit.fill,
        child: Stack(
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
                    height:
                        SizeConfig.getSizeHeightBy(context: context, by: 0.15),
                    width:
                        SizeConfig.getSizeHeightBy(context: context, by: 0.15),
                    cornerRadius: 25),
                Padding(
                  padding: SizeConfig.leftRightPadding(context),
                  child: Column(
                    children: [
                      spaceHeight(20),
                      CustomTextField(
                        controller: controller.txtEmail,
                        lableText: EMAIL,
                        context: context,
                        keyboardType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                        focusNode: controller.emailFocusNode,
                        nextFocusNode: controller.pwdFocusNode,
                      ),
                      spaceHeight(SizeConfig.getSize20(context: context)),
                      CustomTextField(
                        lableText: PASSWORD,
                        obscure: true,
                        context: context,
                        controller: controller.txtPassword,
                        inputAction: TextInputAction.done,
                        focusNode: controller.pwdFocusNode,
                        onFieldSubmit: () {
                          controller.submit();
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: inter(
                                size:
                                    SizeConfig.getFontSize16(context: context),
                                text: FORGOTPASSWORD),
                            onPressed: () {
                              Get.to(() => ForgotPasswordScreen(),
                                  binding: ForgotPasswordBinding());
                            },
                          ),
                        ],
                      ),
                      buttonContainer(
                          height: 48,
                          onTap: () {
                            controller.submit();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              roboto(
                                  size: SizeConfig.getFontSize20(
                                      context: context),
                                  text: LOGIN)
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DONTHAVEACC,
                            style: TextStyle(
                              color: colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  SizeConfig.getFontSize14(context: context),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => SignUpScreen(),
                                  binding: SignUpBinding());
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      SizeConfig.getSize20(context: context)),
                              child: Text(REGISTERNOW,
                                  style: TextStyle(
                                      color: colors.white,
                                      fontSize: SizeConfig.getFontSize14(
                                          context: context),
                                      fontWeight: FontWeight.w800)),
                            ),
                          )
                        ],
                      ),
                      // RichText(
                      //     text: TextSpan(
                      //         style: TextStyle(
                      //           color: colors.white,
                      //           fontWeight: FontWeight.w400,
                      //           fontSize:
                      //               SizeConfig.getFontSize14(context: context),
                      //         ),
                      //         children: [
                      //       const TextSpan(
                      //         text: DONTHAVEACC,
                      //       ),
                      //       TextSpan(
                      //         text: REGISTERNOW,
                      //         recognizer: TapGestureRecognizer()
                      //           ..onTap = () {
                      //             Get.to(() => SignUpScreen(),
                      //                 binding: SignUpBinding());
                      //           },
                      //         style: const TextStyle(
                      //             color: colors.white,
                      //             fontWeight: FontWeight.w800),
                      //       ),
                      //     ])),
                      spaceHeight(SizeConfig.getSize10(context: context)),
                      Padding(
                        padding: SizeConfig.paddingHorizontalBy(
                            context: context, by: 15),
                        child: Column(
                          children: [
                            if (Platform.isIOS)
                              InkWell(
                                onTap: () {
                                  controller.socialLogin(1);
                                },
                                child: whiteContainer(
                                    height:
                                        SizeConfig.getSize40(context: context),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        loadSvg(
                                            image: Assets.appleIco,
                                            height: SizeConfig.getSize20(
                                                context: context),
                                            width: SizeConfig.getSize20(
                                                context: context)),
                                        spaceWidth(SizeConfig.getSize10(
                                            context: context)),
                                        inter(
                                            size: SizeConfig.getFontSize16(
                                                context: context),
                                            text: WITHAPPLE,
                                            color: colors.black)
                                      ],
                                    )),
                              ),
                            spaceHeight(SizeConfig.getSize15(context: context)),
                            InkWell(
                              onTap: () {
                                controller.socialLogin(2);
                              },
                              child: whiteContainer(
                                  height:
                                      SizeConfig.getSize40(context: context),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      loadSvg(
                                          image: Assets.googleIco,
                                          height: SizeConfig.getSize20(
                                              context: context),
                                          width: SizeConfig.getSize20(
                                              context: context)),
                                      spaceWidth(SizeConfig.getSize10(
                                          context: context)),
                                      inter(
                                          size: SizeConfig.getFontSize16(
                                              context: context),
                                          text: WITHGOOGLE,
                                          color: colors.black)
                                    ],
                                  )),
                            ),
                            spaceHeight(SizeConfig.getSize15(context: context)),
                            InkWell(
                              onTap: () {
                                controller.socialLogin(3);
                              },
                              child: whiteContainer(
                                  height:
                                      SizeConfig.getSize40(context: context),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      loadSvg(
                                          image: Assets.facebookIco,
                                          height: SizeConfig.getSize20(
                                              context: context),
                                          width: SizeConfig.getSize20(
                                              context: context)),
                                      spaceWidth(SizeConfig.getSize10(
                                          context: context)),
                                      inter(
                                          size: SizeConfig.getFontSize16(
                                              context: context),
                                          text: WITHFACEBOOK,
                                          color: colors.black)
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      spaceHeight(SizeConfig.getSize15(context: context)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                  TextSpan(text: BY_CONTINUE),
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
                      ),
                    ],
                  ),
                ),
                spaceHeight(SizeConfig.getSize30(context: context))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
