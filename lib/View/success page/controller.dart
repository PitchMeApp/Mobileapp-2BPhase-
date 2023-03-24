import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pitch_me_app/View/Add%20Image%20Page/controller.dart';
import 'package:pitch_me_app/View/Fund%20Page/fund_neccessar_controller.dart';
import 'package:pitch_me_app/View/Location%20Page/location_page_con.dart';
import 'package:pitch_me_app/View/Need%20page/need_page_controller.dart';
import 'package:pitch_me_app/View/Select%20industry/industry_controller.dart';
import 'package:pitch_me_app/View/navigation_controller.dart';
import 'package:pitch_me_app/View/offer_page/controller.dart';
import 'package:pitch_me_app/View/posts/posts.dart';
import 'package:pitch_me_app/View/selected_data_view/selected_controller.dart';
import 'package:pitch_me_app/View/video%20page/Controller/controller.dart';
import 'package:pitch_me_app/View/what%20need/who_need_page_controller.dart';
import 'package:pitch_me_app/core/urls.dart';
import 'package:pitch_me_app/utils/widgets/Navigation/custom_navigation.dart';

class SuccessPageController extends GetxController {
  SelectedController controller = Get.put(SelectedController());
  final InsdustryController insdustryController =
      Get.put(InsdustryController());
  final LocationPageController _locationPageController =
      Get.put(LocationPageController());
  final WhoNeedController _whoNeedController = Get.put(WhoNeedController());
  final FundNacessaryController _fundNacessaryController =
      Get.put(FundNacessaryController());
  final NeedPageController _needPageController = Get.put(NeedPageController());
  final OfferPageController _offerPageController =
      Get.put(OfferPageController());
  final AddImageController _addImageController = Get.put(AddImageController());
  final VideoFirstPageController _videoFirstPageController =
      Get.put(VideoFirstPageController());

  List serviceList = [];
  List typeList = [];

  RxBool isLoading = false.obs;

  Future postSalesPitch(context) async {
    serviceList.clear();
    typeList.clear();
    isLoading.value = true;
    for (var element in _needPageController.selectedNeedType.value) {
      serviceList.add(element['value']);
    }
    for (var element in _whoNeedController.isSelectedItem.value) {
      typeList.add(element['value']);
    }

    //log(_addImageController.fileFullPath.toString());
    try {
      String url = '${BASE_URL}salespitch';
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({
        'type': typeList.toString(),
        'title': _videoFirstPageController.editingController.text,
        'industry': insdustryController.selectedIndustry.value,
        'location': _locationPageController.selectedType.value == 'Place'
            ? _locationPageController.searchController.text
            : _locationPageController.selectedType.value,
        'valueamount': _fundNacessaryController.selectedValue.value,
        'services': serviceList.toString(),
        'servicesDetail': _needPageController.textController.text,
        'description': _offerPageController.offrerTextController.text,
        'status': 1.toString(),
      });

      request.files.add(await http.MultipartFile.fromPath(
          'vid1', _videoFirstPageController.videoUrl.value.toString(),
          filename: _videoFirstPageController.videoUrl.value.split('/').last));
      request.files.add(await http.MultipartFile.fromPath(
        'img1',
        _addImageController.listImagePaths[0].path!,
        filename: _addImageController.listImagePaths[0].path!.split('/').last,
      ));
      if (_addImageController.listImagePaths.length > 1) {
        request.files.add(await http.MultipartFile.fromPath(
          'img2',
          _addImageController.listImagePaths[1].path!,
          filename: _addImageController.listImagePaths[1].path!.split('/').last,
        ));
      }
      if (_addImageController.listImagePaths.length > 2) {
        request.files.add(await http.MultipartFile.fromPath(
          'img3',
          _addImageController.listImagePaths[2].path!,
          filename: _addImageController.listImagePaths[2].path!.split('/').last,
        ));
      }
      if (_addImageController.listImagePaths.length > 3) {
        request.files.add(await http.MultipartFile.fromPath(
          'img4',
          _addImageController.listImagePaths[3].path!,
          filename: _addImageController.listImagePaths[3].path!.split('/').last,
        ));
      }
      if (_addImageController.filePath.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(
          'file',
          _addImageController.fileFullPath,
          filename: _addImageController.fileFullPath.split('/').last,
        ));
      }

      var res = await request.send();
      var response = await res.stream.bytesToString();
      isLoading.value = false;
      var jsonData = jsonDecode(response);

      if (res.statusCode == 201) {
        Get.delete<InsdustryController>(force: true);
        Get.delete<LocationPageController>(force: true);
        Get.delete<WhoNeedController>(force: true);
        Get.delete<FundNacessaryController>(force: true);
        Get.delete<NeedPageController>(force: true);
        Get.delete<OfferPageController>(force: true);
        Get.delete<AddImageController>(force: true);
        Get.delete<VideoFirstPageController>(force: true);
        Get.delete<NavigationController>(force: true);

        Fluttertoast.showToast(
            msg: jsonData['message'], gravity: ToastGravity.CENTER);
        PageNavigateScreen().pushRemovUntil(context, PostPage());
      } else {
        Fluttertoast.showToast(
            msg: jsonData['message'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      isLoading.value = false;
      log('error = ' + e.toString());
    }
  }
}
