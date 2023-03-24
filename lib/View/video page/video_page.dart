import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/View/selected_data_view/selected_page.dart';
import 'package:pitch_me_app/View/video%20page/Controller/controller.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';

import '../../utils/colors/colors.dart';
import '../../utils/strings/strings.dart';
import '../Custom header view/custom_header_view.dart';
import '../Custom header view/new_bottom_bar.dart';
import 'camera_page.dart';

class VideoPageMain extends StatefulWidget {
  const VideoPageMain({super.key});

  @override
  State<VideoPageMain> createState() => _VideoPageMainState();
}

class _VideoPageMainState extends State<VideoPageMain> {
  final VideoFirstPageController _videoFirstPageController =
      Get.put(VideoFirstPageController());
  final _controller = PageController();

  int selectIndex = 2;
  int nextPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: NewCustomBottomBar(),
        body: SafeArea(
          child: PageView(
            controller: _controller,
            scrollDirection: Axis.vertical,
            onPageChanged: (value) {
              setState(() {
                nextPage = value;
              });
            },
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomHeaderView(
                    title: TextStrings.textKey['record']!,
                    icon: 'assets/images/videoc.png',
                    subTitle: '',
                    progressPersent: 0.8,
                    padding: 0,
                  ),
                  //const SizedBox(height: 120),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller:
                              _videoFirstPageController.editingController,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(
                              fontSize: 25,
                              color: DynamicColor.blue,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Title",
                              hintStyle: TextStyle(
                                  fontSize: 25,
                                  color: DynamicColor.lightGrey,
                                  fontWeight: FontWeight.w700)),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () {
                          if (_videoFirstPageController
                              .editingController.text.isNotEmpty) {
                            Get.to(() => const CameraPage(),
                                arguments: _videoFirstPageController
                                    .editingController.text
                                    .toString());
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Please enter title',
                                gravity: ToastGravity.CENTER);
                          }
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "assets/images/video_bg.png",
                              height: 100,
                              width: 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 15),
                              child: Image.asset(
                                "assets/images/videoc.png",
                                height: 40,
                                width: 40,
                                color: DynamicColor.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.getSize10(context: context),
                          right: 5),
                      child: GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.linear);
                        },
                        child: RotatedBox(
                            quarterTurns: 4,
                            child: Image.asset(
                              "assets/Phase 2 icons/ic_keyboard_arrow_down_24px.png",
                              color: Color(0xff377EB4),
                              height: SizeConfig.getSize35(context: context),
                              width: SizeConfig.getSize35(context: context),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SelectedPage(
                showIcon: nextPage,
                pageController: _controller,
              )
            ],
          ),
        ));
  }
}
