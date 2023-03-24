import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';

class BackGroundWidget extends StatelessWidget {
  final Widget child;
  final String backgroundImage;
  final bool bannerRequired;
  final bool backgroundRequired;
  final bool imagebottom;
  final BoxFit fit;
  const BackGroundWidget({
    super.key,
    required this.child,
    required this.backgroundImage,
    this.bannerRequired = true,
    this.backgroundRequired = true,
    this.imagebottom = false,
    this.fit = BoxFit.fitWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.end,
      // textBaseline: TextBaseline.alphabetic,
      children: [
        Expanded(
          flex: 5,
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              if (backgroundRequired)
                Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: colors.primaryColor,
                  ),
                  child: Image.asset(
                    backgroundImage,
                    fit: fit,width: width(context),
                    height: imagebottom? MediaQuery.of(context).size.height/2.2:height(context)*0.85,
                  ),
                ),
              child,
            ],
          ),
        ),
        if (bannerRequired)
          Container(
            width: Get.width,
            height: Get.height * 0.065,
            alignment: Alignment.bottomCenter,
            color: colors.bannerColor,
            child: Center(
              child: Text(
                'Banner',
                style: TextStyle(
                    color: colors.white, fontSize: 16),
              ),
            ),
          )
      ],
    );
  }
}
