import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/core/apis/authApis.dart';
import 'package:pitch_me_app/models/auth/registerDataModel.dart';
import 'package:pitch_me_app/models/auth/userLoginModel.dart';
import 'package:pitch_me_app/screens/auth/linkSentScreen.dart';
import 'package:pitch_me_app/screens/auth/loginScreen.dart';
import 'package:pitch_me_app/screens/businessIdeas/emailConfirm.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/widgets/extras/loading.dart';

class SignupController extends GetxController {
  TextEditingController txtEmail = TextEditingController(),
      txtUserName = TextEditingController(),
      txtPassword = TextEditingController(),
      txtConfirmPassword = TextEditingController();
  FocusNode emailNode = FocusNode(),
      userNameNode = FocusNode(),
      passwordNode = FocusNode(),
      confirmPasswordNode = FocusNode();

  final count = 0.obs;
  var agree = false.obs;
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
    if (txtUserName.text.isEmpty) {
      myToast(msg: 'Username is required');
      return false;
    }
    if (txtPassword.text.isEmpty) {
      myToast(msg: 'Password is required');
      return false;
    }
    if (txtConfirmPassword.text.isEmpty) {
      myToast(msg: 'Confirm Password is required');
      return false;
    }
    if (txtPassword.text.length < 6) {
      myToast(msg: 'Password should be 6 characters long');
      return false;
    }
    if (txtConfirmPassword.text.length < 6) {
      myToast(msg: 'Confirm Password should be 6 characters long');
      return false;
    }

    if (txtConfirmPassword.text != txtPassword.text) {
      myToast(msg: "Password doesn't matched");
      return false;
    }
    if (!agree.value) {
      myToast(msg: 'Please accept terms and conditions');
      return false;
    }
    return true;
  }

  submit() async {
    if (validate()) {
      Get.dialog(Loading());
      RegisterDataModel registerDataModel = RegisterDataModel(
          email: txtEmail.text,
          name: txtUserName.text,
          confirmPass: txtConfirmPassword.text,
          password: txtPassword.text);
      UserLoginModel? result =
          await authApis.register(registerDataModel: registerDataModel);
      if (result != null) {
        await authApis.sendEmail(email: registerDataModel.email!, type: 1);
        Get.back();
        Get.to(() => Email_screen());
      } else {
        Get.back();
      }
    }
  }
}

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}
