import 'package:flutter/material.dart';

Widget myCheckBox(bool value) {
  return value
      ? Icon(Icons.check_box_outlined,color: Colors.white,)
      : Icon(Icons.check_box_outline_blank_rounded,color: Colors.white,);
}
