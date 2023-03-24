import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/View/Add%20Image%20Page/addImage_page.dart';
import 'package:pitch_me_app/View/Add%20Image%20Page/controller.dart';
import 'package:pitch_me_app/View/Fund%20Page/fund_neccessar_controller.dart';
import 'package:pitch_me_app/View/Fund%20Page/funds_page_edit.dart';
import 'package:pitch_me_app/View/Location%20Page/location_page.dart';
import 'package:pitch_me_app/View/Location%20Page/location_page_con.dart';
import 'package:pitch_me_app/View/Need%20page/need_page_controller.dart';
import 'package:pitch_me_app/View/Need%20page/need_page_edit.dart';
import 'package:pitch_me_app/View/Select%20industry/industry_controller.dart';
import 'package:pitch_me_app/View/Select%20industry/select_industry.dart';
import 'package:pitch_me_app/View/navigation_controller.dart';
import 'package:pitch_me_app/View/offer_page/controller.dart';
import 'package:pitch_me_app/View/offer_page/offer_page.dart';
import 'package:pitch_me_app/View/what%20need/what_need_page_edit.dart';
import 'package:pitch_me_app/View/what%20need/who_need_page_controller.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';
import 'package:pitch_me_app/utils/widgets/Navigation/custom_navigation.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colors/colors.dart';
import '../../utils/styles/styles.dart';

class SelectedPage extends StatefulWidget {
  int showIcon;
  PageController pageController;
  SelectedPage(
      {super.key, required this.showIcon, required this.pageController});

  @override
  State<SelectedPage> createState() => _SelectedPageState();
}

class _SelectedPageState extends State<SelectedPage> {
  final _controller = PageController();

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
  final NavigationController _navigationController =
      Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    _whoNeedController.checkType.value = '';
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: bannerWidget(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: Stack(
          children: [
            Column(
              children: [
                spaceHeight(SizeConfig.getSize40(context: context)),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.pageController.previousPage(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.linear);
                            },
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: /* SvgPicture.asset(Assets.tiktokPreviousIco),*/
                                    RotatedBox(
                                  quarterTurns: 6,
                                  child: Image.asset(
                                    "assets/Phase 2 icons/ic_keyboard_arrow_down_24px.png",
                                    color: Color(0xff377EB4),
                                    height:
                                        SizeConfig.getSize35(context: context),
                                    width:
                                        SizeConfig.getSize35(context: context),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Expanded(child: appStatistics(context: context)),
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

  Widget appStatistics({required BuildContext context}) {
    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: [
          customWidget("assets/images/industry-mdpi.png",
              insdustryController.selectedIndustry.value, onPressad: () {
            _navigationController.navigationType.value = 'Edit';
            PageNavigateScreen()
                .push(context, SelectIndustryPage())
                .then((value) {
              setState(() {});
            });
          }),
          customWidget(
              "assets/images/ic_place_24px-mdpi.png",
              _locationPageController.selectedType.value == 'Place'
                  ? _locationPageController.searchController.text
                  : _locationPageController.selectedType.value, onPressad: () {
            _navigationController.navigationType.value = 'Edit';
            PageNavigateScreen().push(context, LocationPage()).then((value) {
              setState(() {});
            });
          }),
          _whoNeedController.checkColor == 1
              ? customWidget(
                  "assets/images/ic_local_atm_24-mdpi (1).png", "Investor",
                  onPressad: () {
                  _navigationController.navigationType.value = 'Edit';
                  PageNavigateScreen()
                      .push(context, WhatNeedPageEdit())
                      .then((value) {
                    setState(() {});
                  });
                })
              : Container(),
          _fundNacessaryController.selectedValue.value.isNotEmpty
              ? Obx(() {
                  return customWidget("assets/images/ic_monetization.png",
                      _fundNacessaryController.selectedValue.value,
                      onPressad: () {
                    _navigationController.navigationType.value = 'Edit';
                    PageNavigateScreen()
                        .push(
                            context,
                            FundsPageEdit(
                              isCheck: false,
                              length: [],
                            ))
                        .then((value) {
                      setState(() {});
                    });
                  });
                })
              : Container(),
          _whoNeedController.checkColor2 == 2
              ? customWidget("assets/images/_Group_-mdpi.png", "Facilitator",
                  onPressad: () {
                  _navigationController.navigationType.value = 'Edit';
                  PageNavigateScreen()
                      .push(context, WhatNeedPageEdit())
                      .then((value) {
                    setState(() {});
                  });
                })
              : Container(),
          _needPageController.itemType.value.isNotEmpty ||
                  (_needPageController.data2[0]['isSelected'] == true ||
                      _needPageController.data2[1]['isSelected'] == true)
              ? Obx(() {
                  return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      padding: EdgeInsets.only(left: 30, right: 30),
                      itemCount:
                          _needPageController.selectedNeedType.value.length,
                      itemBuilder: (context, index) {
                        return customWidget(
                            "assets/images/ic_content_past-mdpi.png",
                            _needPageController.selectedNeedType.value[index]
                                ['value'], onPressad: () {
                          _navigationController.navigationType.value = 'Edit';
                          PageNavigateScreen()
                              .push(context,
                                  NeedPageEdit(isCheck: false, length: []))
                              .then((value) {
                            setState(() {});
                          });
                        });
                      });
                })
              : Container(),
          _needPageController.itemType.value.isNotEmpty
              ? Obx(() {
                  return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      padding: EdgeInsets.only(left: 30, right: 30),
                      itemCount: _needPageController
                          .searchingSelectedItems.value.length,
                      itemBuilder: (context, index) {
                        return customWidget(
                            "assets/images/ic_check_circle-mdpi.png",
                            _needPageController.searchingSelectedItems
                                .value[index], onPressad: () {
                          _navigationController.navigationType.value = 'Edit';
                          PageNavigateScreen()
                              .push(context,
                                  NeedPageEdit(isCheck: false, length: []))
                              .then((value) {
                            setState(() {});
                          });
                        });
                      });
                })
              : Container(),
          customWidget("", _offerPageController.offrerTextController.text,
              onPressad: () {
            _navigationController.navigationType.value = 'Edit';
            PageNavigateScreen().push(context, OfferPage()).then((value) {
              setState(() {});
            });
          }),
          _imagesGridView(),
          spaceHeight(SizeConfig.getSize80(context: context)),
        ],
      )),
    );
  }

  Widget _imagesGridView() {
    return _addImageController.listImagePaths.isEmpty
        ? Container()
        : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            shrinkWrap: true,
            itemCount: _addImageController.listImagePaths.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                mainAxisExtent: 130),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  PageNavigateScreen()
                      .push(context, AddImagePage())
                      .then((value) {
                    setState(() {});
                  });
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Image.file(
                    File(_addImageController.listImagePaths[index].path
                        .toString()),
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          );
  }

  Widget bannerWidget() {
    return Container(
      height: 6.h,
      width: MediaQuery.of(Get.context!).size.width,
      alignment: Alignment.center,
      color: DynamicColor.darkBlue,
      child: Text(
        'Banner',
        style: white15TextStyle,
      ),
    );
  }

  Widget customWidget(iconImage, name, {required VoidCallback onPressad}) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPressad,
      child: Container(
        margin: EdgeInsets.only(bottom: sizeH * 0.015),
        width: sizeW * 0.85,
        height: sizeH * 0.068,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff377EB4),
        ),
        child: ListTile(
            leading: iconImage.isNotEmpty
                ? Image.asset(iconImage, height: sizeH * 0.04)
                : null,
            title: Text(
              name,
              style: TextStyle(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
      ),
    );
  }
}
