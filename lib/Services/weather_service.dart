import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/enums/api_response.dart';
import 'package:weather_app/private.dart';

class WeatherService with ChangeNotifier {
  final Client _client = Client();
  WeatherModel _weatherModel;
  WeatherModel get weatherModel => _weatherModel;

  Future<ApiResponse> getWeatherDetails({@required String city}) async {
    try {
      final url =
          "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&APPID=$API_KEY";
      Response response = await _client.get(url);
      final Map<String, dynamic> decodedData = jsonDecode(response.body);
      print(decodedData);
      if (decodedData == null || decodedData["message"] != null) {
        return ApiResponse.ERROR;
      } else {
        _weatherModel = WeatherModel.fromJson(decodedData);
        notifyListeners();
        return ApiResponse.SUCCESS;
      }
    } catch (e) {
      return ApiResponse.ERROR;
    }
  }
}
