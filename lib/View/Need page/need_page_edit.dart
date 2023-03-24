import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/View/Custom%20header%20view/new_bottom_bar.dart';
import 'package:pitch_me_app/View/Need%20page/need_page_controller.dart';
import 'package:pitch_me_app/View/navigation_controller.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/styles/styles.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colors/colors.dart';
import '../../utils/strings/strings.dart';
import '../../utils/widgets/Arrow Button/arrow_button.dart';
import '../Custom header view/custom_header_view.dart';

class NeedPageEdit extends StatefulWidget {
  bool isCheck;
  List length;
  NeedPageEdit({super.key, required this.isCheck, required this.length});

  @override
  State<NeedPageEdit> createState() => _NeedPageEditState();
}

class _NeedPageEditState extends State<NeedPageEdit> {
  final NeedPageController _needPageController = Get.put(NeedPageController());
  final NavigationController _navigationController =
      Get.put(NavigationController());
  GlobalKey<FormState> abcKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPadding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _needPageController.searchingSelectedItems.isNotEmpty ||
                  (_needPageController.data2[0]['isSelected'] == true ||
                      _needPageController.data2[1]['isSelected'] == true)
              ? ArrowButton(onPressed: () {
                  if (formKey.currentState!.validate() == true) {
                    setState(() {});
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (widget.length.length > 1) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    } else {
                      if (widget.isCheck == true) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      } else {
                        Navigator.of(context).pop();
                      }
                    }
                  }
                })
              : const SizedBox(),
          NewCustomBottomBar()
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomHeaderView(
                  title: TextStrings.textKey['needs']!,
                  icon: 'assets/images/need note.png',
                  subTitle: TextStrings.textKey['sub_needs']!,
                  progressPersent: 0.5,
                  padding: 0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 10, bottom: 10, right: 20),
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
                              Icons.list_alt,
                              _needPageController.data[0]['value'],
                              _needPageController.data[0]['isSelected'],
                              onPressad: () {
                        setState(() {
                          _needPageController.checkColor.value = 1;
                          _needPageController.onselectValue(0);
                          _needPageController.customText.value =
                              'Choose Up to 5 Skills Needed';
                          _needPageController.itemType.value = 'Skill';
                        });
                      })),
                      Container(
                        width: 2,
                        height: 6.h,
                        color: DynamicColor.white,
                      ),
                      Expanded(
                          child: customBox(
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        Icons.settings_suggest,
                        _needPageController.data[1]['value'],
                        _needPageController.data[1]['isSelected'],
                        onPressad: () {
                          setState(() {
                            _needPageController.checkColor.value = 1;
                            _needPageController.onselectValue(1);
                            _needPageController.customText.value =
                                'Choose Up to 5 Services Needed';
                            _needPageController.itemType.value = 'Service';
                          });
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
                        Icons.group,
                        _needPageController.data[2]['value'],
                        _needPageController.data[2]['isSelected'],
                        onPressad: () {
                          setState(() {
                            _needPageController.checkColor.value = 1;
                            _needPageController.onselectValue(2);
                            _needPageController.customText.value =
                                'That "Introduction" that makes all the difference';
                            _needPageController.itemType.value = 'Connection';
                          });
                        },
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 10, bottom: 10, right: 20),
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
                              Icons.chair_alt,
                              _needPageController.data2[0]['value'],
                              _needPageController.data2[0]['isSelected'],
                              onPressad: () {
                        setState(() {
                          _needPageController.checkColor.value = 1;
                          _needPageController.onselectValue2(0, 1);
                          _needPageController.customText.value =
                              'Take care of the Business on your Behalf';

                          _needPageController.searchingSelectedItems.value = [];
                          _needPageController.textController.text = '';
                          _needPageController.searchingItems.value = [];
                        });
                      })),
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
                        Icons.local_atm,
                        _needPageController.data2[1]['value'],
                        _needPageController.data2[1]['isSelected'],
                        onPressad: () {
                          setState(() {
                            _needPageController.checkColor.value = 1;
                            _needPageController.onselectValue2(1, 0);
                            _needPageController.customText.value =
                                'Sell Your Business';

                            _needPageController.searchingSelectedItems.value =
                                [];
                            _needPageController.textController.text = '';
                            _needPageController.searchingItems.value = [];
                          });
                        },
                      )),
                    ],
                  ),
                ),
                _footerHint(),
                _needPageController.customText.value.isNotEmpty
                    ? _searchBar()
                    : Container(),
                searchItemList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _footerHint() {
    return Text(
      _needPageController.customText.value,
      style: blue12,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _searchBar() {
    return (_needPageController.data2[0]['isSelected'] == true ||
            _needPageController.data2[1]['isSelected'] == true)
        ? Container()
        : Obx(() {
            return _needPageController.selectedNeedType.value.isEmpty
                ? Container()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: isPadding ? 20 : 0),
                              child: const Icon(
                                Icons.search,
                                size: 36,
                                color: DynamicColor.blue,
                              ),
                            ),
                            SizedBox(
                              // height: 5.h,
                              width: MediaQuery.of(context).size.width - 80,
                              child: TextFormField(
                                cursorHeight: 22,
                                controller: _needPageController.textController,
                                style: blue15,
                                onChanged: (value) {
                                  setState(() {
                                    _needPageController.hideList.value = false;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Type',
                                  hintStyle: TextStyle(
                                      fontSize: 15,
                                      color:
                                          DynamicColor.blue.withOpacity(0.5)),
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 10,
                                    left: 10,
                                    right: 10,
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: outlineInputBorderBlue,
                                  focusedBorder: outlineInputBorderBlue,
                                  errorBorder: outlineInputBorderBlue,
                                  focusedErrorBorder: outlineInputBorderBlue,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          // width: MediaQuery.of(context).size.width - 80,
                          // padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              runAlignment: WrapAlignment.start,
                              runSpacing: 5.0,
                              children: List.generate(
                                  _needPageController.searchingSelectedItems
                                      .value.length, (index) {
                                dynamic data = _needPageController
                                    .searchingSelectedItems.value[index];
                                return Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: DynamicColor.blue,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  margin: EdgeInsets.only(right: 5),
                                  child: Wrap(
                                    // alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    runAlignment: WrapAlignment.center,
                                    children: [
                                      Text(
                                        data,
                                        style: white13TextStyle,
                                      ),
                                      SizedBox(width: 5),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _needPageController
                                                .searchingSelectedItems.value
                                                .remove(data);
                                          });
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: DynamicColor.white,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })),
                        )
                      ],
                    ),
                  );
          });
  }

  Widget searchItemList() {
    return (_needPageController.searchingSelectedItems.isEmpty &&
                _needPageController.textController.text.isEmpty) ||
            _needPageController.hideList.value == true
        ? Container()
        : Container(
            //height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width - 40,
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: GetBuilder<NeedPageController>(
                  builder: (_needPageController) {
                return ListView.separated(
                    itemCount: _needPageController.searchingItems.length,
                    shrinkWrap: true,
                    primary: false,
                    separatorBuilder: (context, index) => Divider(
                          height: 0,
                        ),
                    itemBuilder: (context, index) {
                      dynamic data = _needPageController.searchingItems[index];

                      if (listFlitter(data)) {
                        return Visibility(
                          visible: !_needPageController
                              .searchingSelectedItems.value
                              .contains(data),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: ChoiceChip(
                              label: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  data,
                                  style: _needPageController
                                          .searchingSelectedItems.value
                                          .contains(data)
                                      ? white13TextStyle
                                      : null,
                                ),
                              ),
                              selected: _needPageController
                                  .searchingSelectedItems.value
                                  .contains(data),
                              selectedColor: DynamicColor.blue,
                              backgroundColor: DynamicColor.white,
                              onSelected: (value) {
                                _needPageController.textController.text = '';
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                if (value == true) {
                                  setState(() {
                                    _needPageController
                                        .searchingSelectedItems.value
                                        .add(data);
                                    _needPageController.hideList.value = true;
                                  });
                                } else {
                                  setState(() {
                                    _needPageController
                                        .searchingSelectedItems.value
                                        .remove(data);
                                  });
                                }
                              },
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    });
              }),
            ),
          );
  }

  Widget customBox(topLeft, bottomLeft, topRight, bottomRight,
      IconData iconData, String string, isSelected,
      {required VoidCallback onPressad}) {
    return InkWell(
      onTap: onPressad,
      child: Container(
        height: 6.h,
        // padding: const EdgeInsets.only(left: 15, right: 15),
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
              color: isSelected ? DynamicColor.darkBlue : DynamicColor.white,
              size: 20,
            ),
            Text(
              string,
              style: TextStyle(
                fontSize: 13.0,
                color: isSelected ? DynamicColor.darkBlue : DynamicColor.white,
                fontWeight: FontWeight.bold,
                //fontFamily: poppies,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  bool listFlitter(String name) {
    if (name
        .toLowerCase()
        .contains(_needPageController.textController.text.toLowerCase())) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
