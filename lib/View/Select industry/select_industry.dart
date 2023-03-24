import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/View/Custom%20header%20view/new_bottom_bar.dart';
import 'package:pitch_me_app/View/Location%20Page/location_page.dart';
import 'package:pitch_me_app/View/Select%20industry/industry_controller.dart';
import 'package:pitch_me_app/View/navigation_controller.dart';
import 'package:pitch_me_app/utils/widgets/Navigation/custom_navigation.dart';

import '../../utils/colors/colors.dart';
import '../../utils/strings/strings.dart';
import '../../utils/styles/styles.dart';
import '../../utils/widgets/Arrow Button/arrow_button.dart';
import '../Custom header view/custom_header_view.dart';

class SelectIndustryPage extends StatefulWidget {
  const SelectIndustryPage({super.key});

  @override
  State<SelectIndustryPage> createState() => _SelectIndustryPageState();
}

class _SelectIndustryPageState extends State<SelectIndustryPage> {
  final scrollController = FixedExtentScrollController();

  final InsdustryController insdustryController =
      Get.put(InsdustryController());
  final NavigationController _navigationController =
      Get.put(NavigationController());

  GlobalKey<FormState> _abcKey = GlobalKey<FormState>();

  int chengeIndexColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ArrowButton(
            onPressed: () {
              try {
                // Get.back();

                if (insdustryController.industryList.result.docs.isNotEmpty) {
                  if (_navigationController.navigationType.value == 'Post') {
                    PageNavigateScreen().push(
                        context,
                        LocationPage(
                          key: _abcKey,
                        ));
                  } else {
                    Navigator.of(context).pop();
                  }
                }
              } catch (e) {
                print(e.toString());
              }
            },
          ),
          NewCustomBottomBar(),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          CustomHeaderView(
            title: TextStrings.textKey['industry']!,
            icon: 'assets/icons/industry.png',
            subTitle: TextStrings.textKey['sun_industry']!,
            progressPersent: 0.1,
            padding: 0,
          ),
          Expanded(child: Obx(() {
            return insdustryController.isLoading.value == true
                ? Center(
                    child: CircularProgressIndicator(color: DynamicColor.blue),
                  )
                : insdustryController.industryList.result.docs.isEmpty
                    ? Center(
                        child: Text('No Industry Available'),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: ClickableListWheelScrollView(
                          scrollController: scrollController,
                          itemHeight: 10,
                          itemCount: insdustryController
                              .industryList.result.docs.length,
                          onItemTapCallback: (index) {
                            setState(() {});
                            // log("onItemTapCallback index: $index");
                            // PageNavigateScreen().push(context, const LocationPage());
                          },
                          child: ListWheelScrollView.useDelegate(
                            controller: scrollController,
                            itemExtent: 50,
                            physics: const FixedExtentScrollPhysics(),
                            overAndUnderCenterOpacity: 0.8,
                            perspective: 0.004,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                chengeIndexColor = index;
                                insdustryController.selectedIndustry.value =
                                    insdustryController
                                        .industryList.result.docs[index].name;
                              });
                            },
                            childDelegate: ListWheelChildBuilderDelegate(
                              childCount: insdustryController
                                  .industryList.result.docs.length,
                              builder: (context, index) {
                                if (chengeIndexColor == 0) {
                                  insdustryController.selectedIndustry.value =
                                      insdustryController
                                          .industryList.result.docs[0].name;
                                }
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: chengeIndexColor == index
                                          ? DynamicColor.blue
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Text(
                                    insdustryController
                                        .industryList.result.docs[index].name,
                                    style: chengeIndexColor == index
                                        ? white17wBold
                                        : blue17,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
          })),
        ],
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
