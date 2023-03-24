import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/View/Custom%20header%20view/new_bottom_bar.dart';
import 'package:pitch_me_app/View/navigation_controller.dart';
import 'package:pitch_me_app/View/offer_page/controller.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/styles/styles.dart';
import 'package:pitch_me_app/utils/widgets/Navigation/custom_navigation.dart';

import '../../utils/strings/strings.dart';
import '../../utils/widgets/Arrow Button/arrow_button.dart';
import '../Add Image Page/addImage_page.dart';
import '../Custom header view/custom_header_view.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({super.key});

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  GlobalKey<FormState> abcKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final OfferPageController _offerPageController =
      Get.put(OfferPageController());
  final NavigationController _navigationController =
      Get.put(NavigationController());
  int checkLine = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _offerPageController.offrerTextController.text.isNotEmpty
              ? ArrowButton(onPressed: () {
                  //Get.back();
                  if (formKey.currentState!.validate() == true) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (_navigationController.navigationType.value == 'Post') {
                      PageNavigateScreen().push(
                          context,
                          AddImagePage(
                            key: abcKey,
                          ));
                    } else {
                      Navigator.of(context).pop();
                    }
                  }
                })
              : const SizedBox(),
          NewCustomBottomBar()
        ],
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomHeaderView(
                title: TextStrings.textKey['offer']!,
                icon: 'assets/images/offer image.png',
                subTitle: "",
                progressPersent: 0.6,
                padding: 0,
              ),
              _searchBar()
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
            // height: 6.h,
            child: TextFormField(
              cursorHeight: 22,
              controller: _offerPageController.offrerTextController,
              style: blue15,
              decoration: InputDecoration(
                  hintText:
                      'Ex: Every 10.000 USD = 5% Ownership.Every 50.000 usd also 3% Royalties.',
                  hintMaxLines: checkLine,
                  hintStyle: TextStyle(
                      fontSize: 15, color: DynamicColor.blue.withOpacity(0.5)),
                  contentPadding:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  border: InputBorder.none,
                  enabledBorder: outlineInputBorderBlue,
                  focusedBorder: outlineInputBorderBlue,
                  errorBorder: outlineInputBorderBlue,
                  focusedErrorBorder: outlineInputBorderBlue),
              onChanged: (value) {
                setState(() {
                  if (_offerPageController
                      .offrerTextController.text.isNotEmpty) {
                    checkLine = 1;
                  } else {
                    checkLine = 2;
                  }
                });
              },
              validator: (value) {
                if (value!.length < 10) {
                  return 'Enter minimum 10 characters';
                }
                return null;
              },
            ),
          ))
        ],
      ),
    );
  }
}
