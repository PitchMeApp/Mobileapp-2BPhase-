import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pitch_me_app/core/urls.dart';
import 'package:pitch_me_app/screens/businessIdeas/Apicall.dart/notification_Model.dart';

Future<notification?> getSinglePostData() async {
  notification? result;
  try {
    final response = await http.get(
      Uri.parse("${BASE_URL}notification/getlimited"),
      // headers: {
      //   HttpHeaders.contentTypeHeader: "application/json",
      // },
    );

    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = notification.fromJson(item);
    } else {
      print("error");
    }
  } catch (e) {
    print("jkufkufrtkufrt ${e.toString()}");
  }
  return result;
}
