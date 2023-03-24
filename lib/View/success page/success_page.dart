import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/View/success%20page/controller.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';

import '../../utils/styles/styles.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({
    super.key,
  });

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  GlobalKey<FormState> abcKey = GlobalKey<FormState>();
  final SuccessPageController _controller = Get.put(SuccessPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Group 12262.png",
                height: 130,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/Rectangle.png",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18, bottom: 20),
                    child: Image.asset(
                      "assets/images/wing.png",
                      width: 80,
                      height: 80,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "You have successfully sent your Sales Pitch for Approval.",
                  style: blue28,
                  textAlign: TextAlign.center,
                ),
              ),
              Obx(() {
                return _controller.isLoading.value == true
                    ? Center(
                        child:
                            CircularProgressIndicator(color: DynamicColor.blue),
                      )
                    : ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(DynamicColor.blue),
                            minimumSize:
                                MaterialStateProperty.all(const Size(110, 40))),
                        onPressed: () {
                          //PageNavigateScreen().pushRemovUntil(context, PostPage());
                          _controller.postSalesPitch(context);
                        },
                        icon: const Icon(Icons.done),
                        label: const Text("OK"));
              })
            ],
          ),
        ],
      ),
    );
  }
}
