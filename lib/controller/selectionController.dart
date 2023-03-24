import 'package:get/get.dart';
import 'package:pitch_me_app/core/apis/authApis.dart';
import 'package:pitch_me_app/core/extras.dart';
import 'package:pitch_me_app/screens/businessIdeas/BottomNavigation.dart';

import 'package:pitch_me_app/utils/strings/keys.dart';
import 'package:pitch_me_app/utils/widgets/extras/loading.dart';

class SelectionController extends GetxController {
  bool selectedIndexPage = false;
  //TODO: Implement DashboardController
  AuthApis authApis = AuthApis();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  submit(int type) async {
    Get.dialog(Loading());
    bool? result = await authApis.setUserType(type: type);
    Get.back();
    if (result != null) {
      pref.write(Keys.USER_TYPE, type);
      Get.offAll(() => Floatbar(type));
    }
  }
}

class SelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectionController>(
      () => SelectionController(),
    );
  }
}
