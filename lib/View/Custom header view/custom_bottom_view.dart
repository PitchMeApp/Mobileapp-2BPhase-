import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/screens/businessIdeas/BottomNavigation.dart';

class CustomFloatbar extends StatefulWidget {
  CustomFloatbar();

  @override
  State<CustomFloatbar> createState() => Custom_FloatbarState();
}

class Custom_FloatbarState extends State<CustomFloatbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween;

  int selectIndex = 2;

  bool isSelectedScreen = true;

  @override
  void initState() {
    changeColors();

    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _colorTween =
        ColorTween(begin: Color(0xff599CD0), end: Colors.white.withOpacity(0.3))
            .animate(_animationController);
    Future.delayed(const Duration(seconds: 0), () {
      _animationController.status == AnimationStatus.completed
          ? _animationController.reset()
          : _animationController.forward();
    });
  }

  Future changeColors() async {
    await Future.delayed(const Duration(seconds: 0), () {
      _animationController.reset();
    });
  }

  List iconlist = [
    "assets/Phase 2 icons/ic_home_24px (1).png",
    "assets/Phase 2 icons/ic_subscriptions_24px.png",
    "assets/Phase 2 icons/ic_add_24px.png",
    "assets/Phase 2 icons/ic_reply_24px.png",
    "assets/Phase 2 icons/ic_person_24px.png",
  ];

  List filleIcons = [
    "assets/Phase 2 icons/ic_home_24px.png",
    "assets/Phase 2 icons/ic_subscriptions_24px (1).png",
    "assets/Phase 2 icons/ic_add_24px (1).png",
    "assets/Phase 2 icons/ic_reply_24px (2).png",
    "assets/Phase 2 icons/ic_person_24px (1).png",
  ];

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(
          bottom: sizeH * 0.02,
          left: sizeW * 0.015,
          right: sizeW * 0.015,
          top: sizeW * 0.05,
        ),
        child: AnimatedBuilder(
            animation: _colorTween,
            builder: (context, child) {
              return Container(
                height: sizeH * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: _colorTween.value,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(109, 20, 20, 20).withOpacity(0.3),
                      blurRadius: 25.0,
                      spreadRadius: 25,
                      offset: Offset(
                        20,
                        20,
                      ),
                    )
                  ],
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: iconlist.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: sizeW * 0.06,
                        ),
                        InkWell(
                            onTap: () async {
                              Future changeColors() async {
                                await Future.delayed(const Duration(seconds: 0),
                                    () {
                                  _animationController.status ==
                                          AnimationStatus.completed
                                      ? _animationController.reset()
                                      : _animationController.forward();
                                });
                              }

                              Duration(seconds: 0);
                              _colorTween = ColorTween(
                                      begin: Color(0xff599CD0),
                                      end: Colors.white.withOpacity(0.3))
                                  .animate(_animationController);

                              _animationController.repeat();
                              changeColors();

                              setState(() {
                                selectIndex = index;
                                isSelectedScreen = false;
                              });
                              if (index != 2) {
                                Get.offAll(() => Floatbar(index));

                                // PageNavigateScreen()
                                //     .push(context, );
                              }
                            },
                            child: Container(
                                height: sizeH * 0.08,
                                width: sizeW * 0.07,
                                child: Image.asset(
                                  selectIndex == index
                                      ? filleIcons[index]
                                      : iconlist[index],
                                ))),
                        SizedBox(
                          width: sizeW * 0.06,
                        )
                      ],
                    );
                  },
                ),
              );
            }));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
