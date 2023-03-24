import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/screens/businessIdeas/blankScreen.dart';
import 'package:pitch_me_app/screens/businessIdeas/swipeContinue.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewPage extends StatefulWidget {
  // const NewPage({super.key});

// var SelectedIndexPage;
//   NewPage({required this.SelectedIndexPage});
  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  var storeValueDATA;

  getShared() async {
    SharedPreferences preferencesData = await SharedPreferences.getInstance();
    setState(() {
      storeValueDATA = preferencesData.getString("log_type");
      print("dhtdfhfghf  ${storeValueDATA}");
    });
  }

  @override
  void initState() {
    getShared();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: storeValueDATA == "1" || storeValueDATA == "2"
            ? comingSoon()
            : swipeContinue());
  }
}
