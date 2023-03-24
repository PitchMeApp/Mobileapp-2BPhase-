import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/View/Add%20Image%20Page/controller.dart';
import 'package:pitch_me_app/View/Custom%20header%20view/new_bottom_bar.dart';
import 'package:pitch_me_app/View/navigation_controller.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:pitch_me_app/utils/strings/strings.dart';
import 'package:pitch_me_app/utils/styles/styles.dart';
import 'package:pitch_me_app/utils/widgets/Arrow%20Button/arrow_button.dart';

import '../../utils/widgets/Navigation/custom_navigation.dart';
import '../Custom header view/custom_header_view.dart';
import '../video page/video_page.dart';

class AddImagePage extends StatefulWidget {
  const AddImagePage({super.key});

  @override
  State<AddImagePage> createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage> {
  final AddImageController _addImageController = Get.put(AddImageController());
  final NavigationController _navigationController =
      Get.put(NavigationController());
  GlobalKey<FormState> abcKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddImageController>(builder: (controller) {
      return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _addImageController.listImagePaths.isNotEmpty ||
                      _addImageController.filePath.isNotEmpty
                  ? ArrowButton(onPressed: () {
                      if (_navigationController.navigationType.value ==
                          'Post') {
                        PageNavigateScreen().push(
                            context,
                            VideoPageMain(
                              key: abcKey,
                            ));
                      } else {
                        Navigator.of(context).pop();
                      }
                    })
                  : Container(),
              NewCustomBottomBar()
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                CustomHeaderView(
                  title: TextStrings.textKey['add_image']!,
                  icon: 'assets/images/add image.png',
                  subTitle: TextStrings.textKey["add_image_sub"]!,
                  progressPersent: 0.7,
                  padding: 0,
                ),
                const SizedBox(height: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    _imagesGridView(),
                    _addButton(),
                  ],
                ),
                const SizedBox(height: 10),
                _addFileButton()
              ],
            ),
          ));
    });
  }

  Widget _imagesGridView() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          mainAxisExtent: 140),
      itemBuilder: (context, index) {
        if (index < _addImageController.listImagePaths.length) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: DynamicColor.blue),
                borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.file(
                    File(_addImageController.listImagePaths[index].path!))),
          );
        }
        return Container(
          padding: EdgeInsets.only(left: 15, top: 20),
          decoration: BoxDecoration(
              color: DynamicColor.blue,
              borderRadius: BorderRadius.circular(30)),
          child: Image.asset("assets/images/gallery icon.png"),
        );
      },
    );
  }

  Widget _addButton() {
    return GestureDetector(
      onTap: () {
        // setState(() {
        _addImageController.selectImages();
        //});
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 18),
            child: Image.asset("assets/images/addback img.png"),
          ),
          Container(
            child: Image.asset(
              "assets/images/add icon.png",
              height: 30,
              width: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _addFileButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Add a File",
          style: blue17,
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            //  setState(() {
            _addImageController.getDocumnetFile();
            //  });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/ic_folder_open_.png',
                  height: 50,
                  width: 50,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 13, right: 17),
                  child: Image.asset(
                    "assets/images/add icon.png",
                    height: 14,
                    width: 14,
                    color: DynamicColor.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(_addImageController.filePath)
      ],
    );
  }
}
