import 'package:flutter/material.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:sizer/sizer.dart';

import '../../utils/styles/styles.dart';

class ProfilePostHeader extends StatelessWidget {
  const ProfilePostHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 5.h,
            width: 10.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: DynamicColor.blue,
                borderRadius: BorderRadius.circular(8.0)),
            child: const Icon(
              Icons.notifications_outlined,
              color: DynamicColor.white,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: DynamicColor.blue,
              borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "Posts",
              style: white15TextStyle,
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 5.h,
            width: 10.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: DynamicColor.blue,
                borderRadius: BorderRadius.circular(8.0)),
            child: const Icon(
              Icons.menu,
              color: DynamicColor.white,
            ),
          ),
        )
      ],
    );
  }
}
