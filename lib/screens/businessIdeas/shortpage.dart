import 'package:flutter/material.dart';
import 'package:pitch_me_app/screens/businessIdeas/businessOwerView.dart';
import 'package:pitch_me_app/screens/businessIdeas/dashBoardScreen.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';

import '../../utils/extras/extras.dart';
import '../../utils/widgets/containers/containers.dart';
import '../../utils/widgets/text/text.dart';

class shortsPage extends StatefulWidget {
  const shortsPage({super.key});

  @override
  State<shortsPage> createState() => _shortsPageState();
}

class _shortsPageState extends State<shortsPage> {
  String title = '';

  int currentIndexOfDashboard = 0;

  late Widget currentScreen;

  @override
  void initState() {
    super.initState();
    currentScreen = businessOwner(
      currentPage: (int index) {
        currentIndexOfDashboard = index;
        setState(() {});
      },
      onSwipe: (int index, String _title, bool isFinish) {
        print("index is $index and title is $title");
        title = _title;
        setState(() {});
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Expanded(child: currentScreen),
          Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.getSize20(context: context) +
                    SizeConfig.getSize20(context: context),
                bottom: SizeConfig.getSize20(context: context),
                left: SizeConfig.getSize20(context: context),
                right: SizeConfig.getSize20(context: context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                currentIndexOfDashboard == 0
                    ? AppBarIconContainer(
                        height: SizeConfig.getSize50(context: context),
                        width: SizeConfig.getSize50(context: context),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child:
                              loadSvg(image: 'assets/image/notifications.svg'),
                        ))
                    : Container(),
                Column(
                  children: [
                    currentIndexOfDashboard == 0
                        ? AppBarIconContainer(
                            height: SizeConfig.getSize50(context: context),
                            width: SizeConfig.getSize50(context: context),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: loadSvg(image: 'assets/image/menu.svg'),
                            ))
                        : Container(),
                    currentIndexOfDashboard == 0
                        ? spaceHeight(10)
                        : spaceHeight(0),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: currentIndexOfDashboard == 0
                            ? AppBarIconContainer(
                                height: SizeConfig.getSize50(context: context),
                                width: SizeConfig.getSize50(context: context),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: loadSvg(
                                    image: 'assets/image/setting.svg',
                                  ),
                                ))
                            : Container())
                  ],
                )
              ],
            ),
          ),
          currentIndexOfDashboard == 0
              ? SafeArea(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff377eb4),
                          borderRadius: BorderRadius.circular(10)),
                      height: sizeH * 0.05,
                      width: sizeW * 0.4,
                      child: Center(
                        child: Text(
                          "Post Title",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
