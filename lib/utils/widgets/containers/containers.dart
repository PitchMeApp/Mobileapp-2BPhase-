// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:pitch_me_app/utils/strings/images.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';

Widget appLogoImage({double? height, double? width, bool isDark = true}) {
  return Image.asset(
    isDark ? Assets.appLogoDarkBluePng : Assets.appLogoPng,
    height: height,
    width: width,
    fit: BoxFit.fitWidth,
  );
}

Widget textFieldContainer(
    {double? height,
    double? width,
    required Widget child,
    double? cornerRadius = 24}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(width: 1.0, color: colors.white),
    ),
    child: child,
  );
}

Widget whiteBorderContainer(
    {double? height,
    double? width,
    required Widget child,
    double cornerRadius = 30}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(cornerRadius),
      color: const Color(0xffffffff),
      border: Border.all(width: 1.0, color: const Color(0xff707070)),
    ),
    child: child,
  );
}

Widget whiteContainer(
    {double? height,
    double? width,
    required Widget child,
    double cornerRadius = 4}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(cornerRadius),
      color: colors.white,
    ),
    child: child,
  );
}

class buttonContainer extends StatefulWidget {
  double? height;
  double? width;
  Widget child;
  bool? fromAppBar = false;
  double? cornerRadius = 10;
  Function() onTap;

  buttonContainer(
      {Key? key,
      this.height,
      this.width,
      required this.child,
      this.fromAppBar,
      required this.onTap,
      this.cornerRadius})
      : super(key: key);

  @override
  State<buttonContainer> createState() => _buttonContainerState();
}

class _buttonContainerState extends State<buttonContainer> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.cornerRadius == null) {
      widget.cornerRadius = 10;
    }
    if (widget.fromAppBar == null) {
      widget.fromAppBar = false;
    }
    return InkWell(
      onTap: () {
        isPressed = !isPressed;
        setState(() {});
        Future.delayed(Duration(milliseconds: 300)).then((value) {
          widget.onTap();
          isPressed = !isPressed;
          setState(() {});
        });
      },
      child: Stack(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.cornerRadius!),
              color: const Color(0xff377eb4),
              boxShadow: [
                if (!isPressed)
                  BoxShadow(
                    color: const Color(0x80000000),
                    offset: Offset(10, 10),
                    blurRadius: 20,
                  ),
              ],
            ),
          ),
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.cornerRadius!),
              color: const Color(0xff377eb4),
              boxShadow: isPressed
                  ? [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(5, 5),
                        spreadRadius: 2,
                        inset: true,
                      ),
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 1,
                        color: Colors.black.withOpacity(0.3),
                        offset: -Offset(5, 5),
                        inset: true,
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: const Color(0xff599cd0),
                        offset: Offset(5, 5),
                        blurRadius: 20,
                      ),
                      BoxShadow(
                        color: const Color(0xff599cd0),
                        offset: Offset(-5, -5),
                        blurRadius: 10,
                      ),
                      if (!widget.fromAppBar!)
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 0.5,
                          color: colors.white.withOpacity(0.3),
                          offset: Offset(-8, -8),
                        )
                    ],
            ),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}

class BottomMenuContainer extends StatefulWidget {
  final double? height;
  final double? width;
  final Widget child;
  double cornerRadius;
  Function() onTap;

  BottomMenuContainer(
      {Key? key,
      this.height,
      this.width,
      required this.onTap,
      required this.child,
      this.cornerRadius = 50})
      : super(key: key);

  @override
  State<BottomMenuContainer> createState() => _BottomMenuContainerState();
}

class _BottomMenuContainerState extends State<BottomMenuContainer> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isPressed = !isPressed;
        setState(() {});
        Future.delayed(Duration(milliseconds: 300)).then((value) {
          isPressed = !isPressed;
          widget.onTap();
          setState(() {});
        });
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        child: widget.child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          color: const Color(0xffe2e2e2),
          boxShadow: isPressed
              ? [
                  BoxShadow(
                      color: colors.black.withOpacity(0.6),
                      offset: Offset(2, 2),
                      blurRadius: 7,
                      inset: true),
                  BoxShadow(
                      color: colors.black.withOpacity(0.6),
                      offset: Offset(-2, -2),
                      blurRadius: 7,
                      inset: true),
                ]
              : [
                  BoxShadow(
                    color: const Color(0xffffffff),
                    offset: Offset(5, 5),
                    blurRadius: 20,
                  ),
                  BoxShadow(
                    color: const Color(0xffffffff),
                    offset: Offset(-5, -5),
                    blurRadius: 10,
                  ),
                ],
        ),
      ),
    );
  }
}
// Widget greyButtonContainer(
//     {double? height,
//     double? width,
//     required Widget child,
//     double cornerRadius = 50}) {
//   return Container(
//     height: height,
//     width: width,
//     child: child,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(cornerRadius),
//       color: const Color(0xffe2e2e2),
//       boxShadow: isPressed
//           ? [
//               BoxShadow(
//                   color: colors.black.withOpacity(0.3),
//                   offset: Offset(5, 5),
//                   blurRadius: 20,
//                   inset: true),
//               BoxShadow(
//                   color: colors.black.withOpacity(0.3),
//                   offset: Offset(-5, -5),
//                   blurRadius: 10,
//                   inset: true),
//             ]
//           : [
//               BoxShadow(
//                 color: const Color(0xffffffff),
//                 offset: Offset(5, 5),
//                 blurRadius: 20,
//               ),
//               BoxShadow(
//                 color: const Color(0xffffffff),
//                 offset: Offset(-5, -5),
//                 blurRadius: 10,
//               ),
//             ],
//     ),
//   );
// }

class AppBarIconContainer extends StatefulWidget {
  final double? height;
  final double? width;
  final Widget child;
  double cornerRadius;

  AppBarIconContainer(
      {Key? key,
      this.height,
      this.width,
      required this.child,
      this.cornerRadius = 10})
      : super(key: key);

  @override
  State<AppBarIconContainer> createState() => _AppBarIconContainerState();
}

class _AppBarIconContainerState extends State<AppBarIconContainer> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isPressed = !isPressed;
        setState(() {});
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.cornerRadius),
            color: const Color(0xff377eb4),
            boxShadow: isPressed
                ? [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(5, 5),
                      spreadRadius: 2,
                      inset: true,
                    ),
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 1,
                      color: Colors.black.withOpacity(0.3),
                      offset: -Offset(5, 5),
                      inset: true,
                    ),
                  ]
                : []),
        child: widget.child,
      ),
    );
  }
}
