// dev

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pitch_me_app/View/posts/model.dart';
import 'package:pitch_me_app/core/urls.dart';
import 'package:pitch_me_app/models/industry_model.dart';

class GetApiService {
  Future<IndustryModel> getIndusrtyApi() async {
    String url = '${BASE_URL}industry';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
    });

    IndustryModel data = industryModelFromJson(response.body.toString());

    return data;
  }

  Future<IndustryModel> getServiceApi() async {
    String url = '${BASE_URL}services';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
    });

    IndustryModel data = industryModelFromJson(response.body.toString());

    return data;
  }

  Future<SalesPitchListModel> getSalesPiitchListApi() async {
    String url = '${BASE_URL}salespitch';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
    });

    SalesPitchListModel data =
        salesPitchListModelFromJson(response.body.toString());

    return data;
  }
  // DELETE

  Future deleteSalesPittchApi(id) async {
    String url = '${BASE_URL}salespitch/$id';
    final response = await http.delete(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
    });

    dynamic data = jsonDecode(response.body);

    return data;
  }
}
