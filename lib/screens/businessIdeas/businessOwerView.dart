import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/screens/businessIdeas/HomepageCard.dart';
import 'package:pitch_me_app/screens/businessIdeas/ownerScreen.dart';
import 'package:pitch_me_app/screens/businessIdeas/statisticsPage.dart';

import '../../controller/businessIdeas/dashBoardController.dart';
import '../../utils/sizeConfig/sizeConfig.dart';
import '../../utils/strings/images.dart';
import '../../utils/widgets/text/text.dart';

class businessOwner extends StatefulWidget {
  final Function(int index) currentPage;
  final Function(int index, String title, bool isFinish) onSwipe;
  const businessOwner(
      {Key? key, required this.currentPage, required this.onSwipe})
      : super(key: key);

  @override
  State<businessOwner> createState() => _businessOwnerState();
}

class _businessOwnerState extends State<businessOwner> {
  final _controller = PageController();
  DashboardController controller = Get.put(DashboardController());

  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getPost(widget.onSwipe);
    controller.getStatic();
    _controller.addListener(() {
      widget.currentPage(_controller.page!.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return PageView(
        controller: _controller,
        physics: /*controller.isFinish.value? NeverScrollableScrollPhysics():*/
            ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          controller.isLoadingPost.value == true
              ? Center(child: CircularProgressIndicator())
              : controller.hasError.value
                  ? Center(
                      child: roboto(size: 20, text: 'Something went wrong'))
                  : controller.isFinish.value
                      ? Stack(
                          children: [
                            Center(
                                child: roboto(
                                    size: 20, text: 'No more post available')),
                          ],
                        )
                      : HomePageWidget(
                          controller: _controller,
                          onSwipe: (int index, String title, bool isFinish) {
                            print("Is finish is $isFinish");
                            controller.isFinish.value = isFinish;
                            widget.onSwipe(index, title, isFinish);
                          },
                          postModel: controller.postModel.value,
                        ),
          controller.isLoadingStats.value == true
              ? Center(child: CircularProgressIndicator())
              : ownerPage()
        ],
      );
    }));
  }
}
