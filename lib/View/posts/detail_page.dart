import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/View/posts/model.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colors/colors.dart';
import '../../utils/styles/styles.dart';

class PostDetailPage extends StatefulWidget {
  final data;
  PostDetailPage({super.key, this.data});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final _controller = PageController();
  late SalesDoc data;
  List typeList = [];
  List serviceList = [];

  @override
  void initState() {
    data = widget.data;
    var type = data.type.replaceAll('[', '').replaceAll(']', '');
    typeList = type.split(', ');
    var service = data.services.replaceAll('[', '').replaceAll(']', '');
    serviceList = service.split(', ');
    log(serviceList.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10, left: 10),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back)),
                        ),
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
          customWidget("assets/images/industry-mdpi.png", data.industry,
              onPressad: () {
            //PageNavigateScreen().push(context, SelectIndustryPage());
          }),
          customWidget("assets/images/ic_place_24px-mdpi.png", data.location,
              onPressad: () {
            // PageNavigateScreen().push(context, LocationPage());
          }),
          typeList.length > 0
              ? customWidget(
                  "assets/images/ic_local_atm_24-mdpi (1).png", typeList[0],
                  onPressad: () {
                  //PageNavigateScreen().push(context, WhatNeedPage());
                })
              : Container(),
          data.valueamount.isNotEmpty
              ? customWidget(
                  "assets/images/ic_monetization.png", data.valueamount,
                  onPressad: () {
                  // PageNavigateScreen().push(context, FundsPage());
                })
              : Container(),
          typeList.length > 1
              ? customWidget("assets/images/_Group_-mdpi.png", typeList[1],
                  onPressad: () {
                  // PageNavigateScreen().push(context, WhatNeedPage());
                })
              : Container(),
          serviceList.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  itemCount: serviceList.length,
                  itemBuilder: (context, index) {
                    return customWidget(
                        "assets/images/ic_content_past-mdpi.png",
                        serviceList[index], onPressad: () {
                      //PageNavigateScreen().push(context, NeedPage());
                    });
                  })
              : Container(),
          data.servicesDetail.isNotEmpty
              ? customWidget(
                  "assets/images/ic_check_circle-mdpi.png", data.servicesDetail,
                  onPressad: () {
                  // PageNavigateScreen().push(context, NeedPage());
                })
              : Container(),
          customWidget("", data.description, onPressad: () {
            //PageNavigateScreen().push(context, OfferPage());
          }),
          _imagesGridView()
        ],
      )),
    );
  }

  Widget _imagesGridView() {
    return
        // _addImageController.listImagePaths.isEmpty
        //     ? Container()
        //     :
        GridView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                mainAxisExtent: 130),
            children: [
          data.img1.isNotEmpty ? imageWidget(data.img1) : Container(),
          data.img2.isNotEmpty ? imageWidget(data.img2) : Container(),
          data.img3.isNotEmpty ? imageWidget(data.img3) : Container(),
          data.img4.isNotEmpty ? imageWidget(data.img4) : Container(),
        ]);
  }

  Widget imageWidget(url) {
    return InkWell(
      onTap: () {
        // PageNavigateScreen().push(context, AddImagePage());
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Image.network(
          url,
          fit: BoxFit.contain,
        ),
      ),
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
            )),
      ),
    );
  }
}
