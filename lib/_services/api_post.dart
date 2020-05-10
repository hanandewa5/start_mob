import 'package:dio/dio.dart';
import 'package:start_mob/_constants/app_config.dart';
import 'package:start_mob/models/res_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiPost {
  var client = Dio();
  static const endpoint = AppConfig.apiUrl;
  var header = new Map<String, String>.from(AppConfig.header);
  static const authEndpoint = '$endpoint/login';
  static const rigActivitiesEndpoint = '$endpoint/daily_rig_activities';
  static const dailyActivitiesEndpoint = '$endpoint/daily_activities';
  static const weatherEndpoint = '$endpoint/weather_condition';
  static const equipmentConditionsEndpoint = '$endpoint/equipment_conditions';
  static const gasMonitorsEndpoint = '$endpoint/gassensor_records';

  Future<ResApi> requestPostWithoutToken(
      String endpointUrl, Map<String, dynamic> data) async {
    FormData formData = FormData.fromMap(data);
    try {
      var response = await client
          .post(endpointUrl,
              data: formData,
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
    FormData formData = FormData.fromMap(data);
    try {
      var response = await client
          .post(endpointUrl,
              data: formData,
              options: Options(headers: header, followRedirects: false))
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

  Future login(String email, String password) async {
    Map<String, dynamic> data = {"email": email, "password": password};
    var result = await requestPostWithoutToken("$authEndpoint", data);
    return result;
  }

  Future<ResApi> createRigActivity(Map<String, dynamic> data) async {
    var result = await requestPostWithToken("$rigActivitiesEndpoint", data);
    return result;
  }

  Future<ResApi> createDailyActivity(Map<String, dynamic> data) async {
    var result = await requestPostWithToken("$dailyActivitiesEndpoint", data);
    return result;
  }

  Future<ResApi> createEquipmentCondition(Map<String, dynamic> data) async {
    var result =
        await requestPostWithToken("$equipmentConditionsEndpoint", data);
    return result;
  }

  Future<ResApi> createWeather(Map<String, dynamic> data) async {
    var result = await requestPostWithToken("$weatherEndpoint", data);
    return result;
  }

  Future<ResApi> createGasMonitor(Map<String, dynamic> data) async {
    var result = await requestPostWithToken("$gasMonitorsEndpoint", data);
    return result;
  }
}
