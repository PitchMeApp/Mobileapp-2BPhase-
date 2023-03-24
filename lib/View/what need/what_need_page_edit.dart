import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/View/Fund%20Page/funds_page_edit.dart';
import 'package:pitch_me_app/View/Need%20page/need_page_edit.dart';
import 'package:pitch_me_app/View/navigation_controller.dart';
import 'package:pitch_me_app/View/what%20need/who_need_page_controller.dart';
import 'package:pitch_me_app/utils/widgets/Navigation/custom_navigation.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colors/colors.dart';
import '../../utils/strings/strings.dart';
import '../../utils/styles/styles.dart';
import '../../utils/widgets/Arrow Button/arrow_button.dart';
import '../Custom header view/custom_header_view.dart';
import '../Custom header view/new_bottom_bar.dart';

class WhatNeedPageEdit extends StatefulWidget {
  const WhatNeedPageEdit({super.key});

  @override
  State<WhatNeedPageEdit> createState() => _WhatNeedPageEditState();
}

class _WhatNeedPageEditState extends State<WhatNeedPageEdit> {
  final WhoNeedController _whoNeedController = Get.put(WhoNeedController());
  final NavigationController _navigationController =
      Get.put(NavigationController());
  GlobalKey<FormState> abcKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _whoNeedController.isSelectedItem.value.isNotEmpty
              ? ArrowButton(onPressed: () {
                  try {
                    if (_whoNeedController.checkType.value.isEmpty) {
                      Navigator.pop(context);
                    } else {
                      if (_whoNeedController.checkType.value == 'Investor') {
                        PageNavigateScreen().push(
                            context,
                            FundsPageEdit(
                              key: abcKey,
                              isCheck: true,
                              length: _whoNeedController.isSelectedItem.value,
                            ));
                      } else if (_whoNeedController.checkType.value ==
                          'Facilitator') {
                        PageNavigateScreen().push(
                            context,
                            NeedPageEdit(
                              key: abcKey,
                              isCheck: true,
                              length: [],
                            ));
                      } else {
                        PageNavigateScreen().push(
                            context,
                            FundsPageEdit(
                              key: abcKey,
                              isCheck: true,
                              length: _whoNeedController.isSelectedItem.value,
                            ));
                      }
                    }
                  } catch (e) {}
                })
              : Container(),
          NewCustomBottomBar(),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeaderView(
              title: TextStrings.textKey['what_need']!,
              icon: 'assets/icons/people.png',
              subTitle: TextStrings.textKey['sub_what_need']!,
              subTitle2: TextStrings.textKey['sub_what_need2']!,
              progressPersent: 0.3,
              padding: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, top: 10, bottom: 10, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: customBox(
                    10.0,
                    10.0,
                    0.0,
                    0.0,
                    _whoNeedController.data[0]['icon'],
                    _whoNeedController.data[0]['value'],
                    _whoNeedController.data[0]['isSelected'],
                    onPressad: () {
                      setState(() {});
                      _whoNeedController
                          .onselectItem(_whoNeedController.data[0]);
                    },
                  )),
                  Container(
                    width: 2,
                    height: 6.h,
                    color: DynamicColor.white,
                  ),
                  Expanded(
                      child: customBox(
                    0.0,
                    0.0,
                    10.0,
                    10.0,
                    _whoNeedController.data[1]['icon'],
                    _whoNeedController.data[1]['value'],
                    _whoNeedController.data[1]['isSelected'],
                    onPressad: () {
                      setState(() {
                        _whoNeedController
                            .onselectItem(_whoNeedController.data[1]);
                      });
                    },
                  )),
                ],
              ),
            ),
            _whoNeedController.isSelectedItem.value.isNotEmpty
                ? _footerHint()
                : Container()
          ],
        ),
      )),
    );
  }

  Widget _footerHint() {
    return Text(
      TextStrings.textKey['what_need_sub_text']!,
      style: blue12,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget customBox(topLeft, bottomLeft, topRight, bottomRight,
      IconData iconData, String string, isCheck,
      {required VoidCallback onPressad}) {
    return GestureDetector(
      onTap: onPressad,
      child: Container(
        height: 6.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: DynamicColor.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              bottomLeft: Radius.circular(bottomLeft),
              topRight: Radius.circular(topRight),
              bottomRight: Radius.circular(bottomRight),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: isCheck ? DynamicColor.darkBlue : DynamicColor.white,
            ),
            Text(
              string,
              style: isCheck ? darkBlue15 : white15TextStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
