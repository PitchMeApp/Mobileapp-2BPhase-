import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FundNacessaryController extends GetxController {
  final scrollController = FixedExtentScrollController();

  dynamic industryList;
  RxList checkItem = RxList([].obs);
  RxList getValueList = RxList([].obs);

  RxInt chengeIndexColor = 0.obs;

  RxString selectedValue = ''.obs;
  List data = [
    {'value': '<50K', 'divide_by': '5000', 'isSelected': false},
    {'value': '50K-100K', 'divide_by': '5000', 'isSelected': false},
    {'value': '100K-500K', 'divide_by': '100000', 'isSelected': false},
    {'value': '500K-1Mil', 'divide_by': '100000', 'isSelected': false},
    {'value': '1Mil-10Mil', 'divide_by': '500000', 'isSelected': false},
    {'value': '>10Mil', 'divide_by': '1000000', 'isSelected': false},
  ];

  onselectAmount(value, index) {
    //industryList.value.clear();

    for (var element in data) {
      if (value == element) {
        if (element['isSelected'] != true) {
          checkItem.value.add(element);

          element['isSelected'] = true;
          checkValue(value['value'], value['isSelected']);
        } else {
          element['isSelected'] = false;
          checkItem.value.remove(element);
          checkValue(value['value'], value['isSelected']);

          update();
        }

        update();
      }
    }
  }

  checkValue(index, isSelected) {
    // int firstNumber = 0;
    // int secondNumber = 0;

    switch (index) {
      case '<50K':
        // firstNumber = 5000;
        // secondNumber = 50000;
        // for (var i = firstNumber; i <= secondNumber; i++) {
        //   if (i % int.parse(divideBy) == 0) {
        //     industryList.add(i);
        //   }
        // }
        industryList = {
          "5.000",
          "10.000",
          "15.000",
          "20.000",
          "25.000",
          "30.000",
          "35.000",
          "40.000",
          "45.000",
          //"50.000"
        };

        if (isSelected == true) {
          for (var element in industryList) {
            getValueList.add(element);
          }

          update();
        } else {
          for (var element in industryList) {
            getValueList.remove(element);
          }

          update();
        }
        break;
      case '50K-100K':
        industryList = {
          "50.000",
          "55.000",
          "60.000",
          "65.000",
          "70.000",
          "75.000",
          "80.000",
          "85.000",
          "90.000",
          "95.000",
          "100.000"
        };

        if (isSelected == true) {
          for (var element in industryList) {
            getValueList.add(element);
          }

          update();
        } else {
          for (var element in industryList) {
            getValueList.remove(element);
          }

          update();
        }
        break;
      case '100K-500K':
        industryList = {
          // "100.000",
          "200.000", "300.000", "400.000", "500.000"
        };

        if (isSelected == true) {
          for (var element in industryList) {
            getValueList.add(element);
          }

          update();
        } else {
          for (var element in industryList) {
            getValueList.remove(element);
          }

          update();
        }
        break;
      case '500K-1Mil':
        industryList = {
          //"500.000",
          "600.000",
          "700.000",
          "800.000",
          "900.000",
          "1Mil",
        };

        if (isSelected == true) {
          for (var element in industryList) {
            getValueList.add(element);
          }

          update();
        } else {
          for (var element in industryList) {
            getValueList.remove(element);
          }

          update();
        }
        break;
      case '1Mil-10Mil':
        industryList = {
          //"1Mil",
          "2Mil",
          "3Mil",
          "4Mil",
          "5Mil",
          "6Mil",
          "7Mil",
          "8Mil",
          "9Mil",
          "10Mil"
        };

        if (isSelected == true) {
          for (var element in industryList) {
            getValueList.add(element);
          }

          update();
        } else {
          for (var element in industryList) {
            getValueList.remove(element);
          }

          update();
        }
        break;
      case '>10Mil':
        industryList = {
          //"10Mil",
          "20Mil",
          "30Mil",
          "40Mil",
          "50Mil",
          "60Mil",
          "70Mil",
          "80Mil",
          "90Mil",
          "100Mil"
        };

        if (isSelected == true) {
          for (var element in industryList) {
            getValueList.add(element);
          }

          update();
        } else {
          for (var element in industryList) {
            getValueList.remove(element);
          }

          update();
        }

        break;
      default:
    }
  }
}
