import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:flutter_app/common/const.dart';

///模拟数据
class MockRequest {

  Future<dynamic> get(String action, {Map params}) async {
    return MockRequest.mock(action: getJsonName(action), params: params);
  }

  static Future<dynamic> post({String action, Map params}) async {
    return MockRequest.mock(action: action, params: params);
  }

  static Future<dynamic> mock({String action, Map params}) async {
    var responseStr = await rootBundle.loadString('mock/$action.json');
    var responseJson = json.decode(responseStr);
    return responseJson;
  }

  Map<String, String> map = {
    Constant.IN_THEATERS: 'in_theaters',
    Constant.COMING_SOON: 'coming_soon',
    Constant.TOP_250: 'top250',
    Constant.WEEKLY: 'weekly',
    Constant.REIVIEWS: 'reviews',
  };

  getJsonName(String action) {
    return map[action];
  }
}
