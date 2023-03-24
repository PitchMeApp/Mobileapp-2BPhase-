import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pitch_me_app/screens/businessIdeas/Apicall.dart/api_Integration.dart';
import 'package:pitch_me_app/screens/businessIdeas/Apicall.dart/notification_Model.dart';

class DataClass extends ChangeNotifier {
  notification? post;
  bool loading = false;

  getPostData() async {
    loading = false;
    post = (await getSinglePostData())!;
    loading = false;

    notifyListeners();
  }
}
