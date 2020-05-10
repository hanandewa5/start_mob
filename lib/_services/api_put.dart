import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:start_mob/_constants/app_config.dart';
import 'package:start_mob/models/res_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiPut {
  var client = Dio();
  static const endpoint = AppConfig.apiUrl;
  var header = new Map<String, String>.from(AppConfig.header);
  static const equipmentConditionApproveEndpoint =
      '$endpoint/equipmentconditionapprove';
  static const gasSensorRecordApproveEndpoint =
      '$endpoint/gassensorrecordapprove';
  static const rigActivityApproveEndpoint = '$endpoint/dailyrigactivityapprove';
  static const dailyActivitynApproveEndpoint =
      '$endpoint/dailyactivitynapprove';
  static const weatherConditionApproveEndpoint =
      '$endpoint/weatherconditionapprove';
  static const updateToken = '$endpoint/updatetokenfcm';
  static const updateReadNotifEndpoint = '$endpoint/putread';

  Future<ResApi> requestPostWithoutToken(
      String endpointUrl, Map<String, dynamic> data) async {
    try {
      var response = await client
          .put(endpointUrl,
              data: json.encode(data),
              options: Options(
                  // followRedirects: false,
                  ))
          .timeout(Duration(seconds: AppConfig.timeoutRequest));
      return ResApi.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        Map<String, dynamic> data = {
          "success": false,
          "message": "Username or Password incorrect !",
          "data": null
        };
        return ResApi.fromJson(data);
      } else {
        Map<String, dynamic> data = {
          "success": false,
          "message":
              "Connection problem, please try again or check your connection",
          "data": null
        };
        return ResApi.fromJson(data);
      }
    }
  }

  Future<ResApi> requestPostWithToken(
      String endpointUrl, Map<String, dynamic> data) async {
    // var body = json.encode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    header["Authorization"] = prefs.getString("token");
    try {
      var response = await client
          .put(endpointUrl,
              data: json.encode(data),
              options: Options(headers: header, followRedirects: true))
          .timeout(Duration(seconds: AppConfig.timeoutRequest));
      return ResApi.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      Map<String, dynamic> data = {
        "success": false,
        "message":
            "Connection problem, please try again or check your connection",
        "data": null
      };
      return ResApi.fromJson(data);
    }
  }

  Future<ResApi> updateApproveCondition(
      int id, String type, bool isApprove, String reason) async {
    Map<String, dynamic> data = {
      "id": id,
      "status_name": isApprove ? "approve" : "reject",
      "reasons": reason
    };
    var url;
    switch (type) {
      case "Gas Sensor Record":
        url = gasSensorRecordApproveEndpoint;
        break;
      case "Daily Activity":
        url = dailyActivitynApproveEndpoint;
        break;
      case "Daily Rig Activity":
        url = rigActivityApproveEndpoint;
        break;
      case "Weather Condition":
        url = weatherConditionApproveEndpoint;
        break;
      case "Equipment Condition":
        url = equipmentConditionApproveEndpoint;
        break;
      default:
        url = "";
    }
    print(url);
    var result = await requestPostWithToken(url, data);
    return result;
  }

  Future<ResApi> updateTokenFirebase(int id, String token) async {
    Map<String, dynamic> data = {"user_id": id, "firebase_token": token};
    var res = await requestPostWithToken("$updateToken", data);
    return res;
  }

  Future<ResApi> updateReadNotif(int id) async {
    Map<String, dynamic> data = {"id": id, "is_read": true};
    var res = await requestPostWithToken("$updateReadNotifEndpoint", data);
    print(res.data);
    return res;
  }
}
