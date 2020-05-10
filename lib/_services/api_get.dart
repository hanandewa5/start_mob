import 'package:dio/dio.dart';
import 'package:start_mob/_constants/app_config.dart';
import 'package:start_mob/models/res_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiGet {
  var client = Dio();
  static const endpoint = AppConfig.apiUrl;
  var header = new Map<String, String>.from(AppConfig.header);
  static const equipmentsEndpoint = '$endpoint/equipments';

  Future<ResApi> requestGetWithToken(String endpointUrl) async {
    // var body = json.encode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    header["Authorization"] = prefs.getString("token");
    try {
      var response = await client
          .get(endpointUrl,
              options: Options(
                  headers: header,
                  followRedirects: false,
                  validateStatus: (status) {
                    return status < 500;
                  }))
          .timeout(Duration(seconds: AppConfig.timeoutRequest));
      return ResApi.fromJson(response.data);
    } catch (e) {
      print(endpointUrl);
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

  Future<ResApi> getEquipments() async {
    var result = await requestGetWithToken("$equipmentsEndpoint");
    return result;
  }
}
