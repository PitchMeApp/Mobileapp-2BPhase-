import 'package:get/get.dart';
import 'package:pitch_me_app/devApi%20Service/get_api.dart';
import 'package:pitch_me_app/models/industry_model.dart';

class InsdustryController extends GetxController {
  RxBool isLoading = false.obs;
  late IndustryModel industryList;
  RxString selectedIndustry = ''.obs;

  Future<IndustryModel> getIndustryApiCall() async {
    isLoading.value = true;
    try {
      await GetApiService().getIndusrtyApi().then((value) {
        industryList = value;
        isLoading.value = false;
      });
    } catch (e) {
      industryList.result.docs = [];
      isLoading.value = false;
    }
    return industryList;
  }

  @override
  void onInit() {
    getIndustryApiCall();
    super.onInit();
  }
}
