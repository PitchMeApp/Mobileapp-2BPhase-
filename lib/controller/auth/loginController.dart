import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/controller/selectionController.dart';
import 'package:pitch_me_app/core/apis/authApis.dart';
import 'package:pitch_me_app/core/signin/appleSiugnIn.dart';
import 'package:pitch_me_app/core/signin/facebookSignin.dart';
import 'package:pitch_me_app/core/signin/signInWithGoogle.dart';
import 'package:pitch_me_app/models/auth/userLoginModel.dart';
import 'package:pitch_me_app/screens/businessIdeas/BottomNavigation.dart';
import 'package:pitch_me_app/screens/selectionScreen.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/widgets/extras/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final count = 0.obs;
  var emailFocus = false.obs, agree = false.obs;
  TextEditingController txtEmail = TextEditingController(),
      txtPassword = TextEditingController();
  FocusNode emailFocusNode = FocusNode(), pwdFocusNode = FocusNode();
  AuthApis authApis = AuthApis();

  bool validate() {
    if (txtEmail.text.isEmpty) {
      myToast(msg: 'Email is required');
      return false;
    }
    if (GetUtils.isEmail(txtEmail.text) == false) {
      myToast(msg: 'Please enter correct email');
      return false;
    }
    if (txtPassword.text.isEmpty) {
      myToast(msg: 'Password is required');
      return false;
    }
    if (txtPassword.text.length < 6) {
      myToast(msg: 'Password should be 6 characters long');
      return false;
    }
    return true;
  }

  submit() async {
    print("object");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (validate()) {
      Get.dialog(Loading());
      UserLoginModel? result = await authApis.login(
          email: txtEmail.text, passwrod: txtPassword.text);
      // login(
      //     email: txtEmail.text, passwrod: txtPassword.text);
      //print("id ${result!.user!.sId}");
      Get.back();
      if (result != null) {
        print("idAbc ${result.token}");
        prefs.setString("tok", result.token.toString());
        var log =
            prefs.setString("log_type", result.user!.loginType.toString());
        print("dhtdfhfghfff ${result.user!.loginType.toString()}");
        AuthApis.setData(userLoginModel: result);
        if (result.user!.loginType == null || result.user!.loginType == 0) {
          Get.offAll(() => SelectionScreen(), binding: SelectionBinding());
        } else {
          Get.offAll(() => Floatbar(0));
        }
      }
    }
  }

  Future<void> socialLogin(int which) async {
    try {
      Get.dialog(Loading());
      UserCredential? userCredential = which == 1
          ? await signInWithApple()
          : which == 2
              ? await signInWithGoogle()
              : await signInWithFacebook();
      log("User creds are ${userCredential.toString()}");
      if (userCredential != null && userCredential.user != null) {
        Get.back();
//        myToast(msg: 'Social signin success');
        Get.dialog(Loading());
        UserLoginModel? result = await authApis.socialLogin(
            email: userCredential.user!.email!,
            name: userCredential.user!.displayName == null
                ? '${userCredential.user!.email!}'
                : userCredential.user!.displayName!,
            uid: userCredential.user!.uid,
            type: which == 1
                ? 4
                : which == 2
                    ? 2
                    : 3);
        Get.back();
        if (result != null) {
          AuthApis.setData(userLoginModel: result);
          if (result.user!.loginType == null || result.user!.loginType == 0) {
            Get.offAll(() => SelectionScreen(), binding: SelectionBinding());
          } else {
            Get.offAll(() => Floatbar(0));
          }
        }
      } else {
        Get.back();
      }
    } catch (e) {
      Get.back();
      myToast(msg: e.toString());
    }
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
