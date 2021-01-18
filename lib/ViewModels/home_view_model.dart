import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/network_service.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/ViewModels/base_model.dart';
import 'package:weather_app/enums/api_response.dart';
import 'package:weather_app/enums/view_state.dart';
import 'package:weather_app/locator.dart';

class HomeViewModel extends BaseModel {
  final weatherService = locator<WeatherService>();
  NetworkService networkService = new NetworkService();
  WeatherModel weatherModel = WeatherModel(
    weather: "rain",
    cloud: 20,
    humidity: 30,
    icon: "10d",
    locationName: "Abuja",
    maxTemp: 20,
    minTemp: 30,
    temp: 25,
    weatherDescription: "Raining",
    wind: 3,
    date: DateTime(2020, 11, 5),
  );
  onSearch({@required String value}) async {
    try {
      setViewState(ViewState.Busy);
      ApiResponse apiResponse =
          await weatherService.getWeatherDetails(city: value);
      setViewState(ViewState.Idle);
      if (apiResponse == ApiResponse.SUCCESS) {
        setViewState(ViewState.Success);
        weatherModel = weatherService.weatherModel;
        notifyListeners();
        print("Saved Data Locally.");
        saveWeatherToDB();
        print(weatherModel.locationName);
      } else if (apiResponse == ApiResponse.NULL) {
        print("An error occured");
        setViewState(ViewState.Error);
      } else if (apiResponse == ApiResponse.ERROR) {
        print("An error occured");
        setViewState(ViewState.Error);
      } else {
        print("An error occured");
        setViewState(ViewState.Error);
      }
    } catch (e) {
      setViewState(ViewState.Idle);
      print(e);
    }
  }

  void saveWeatherToDB() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    await _sharedPreferences.setString(
        "weather", weatherModelToJson(weatherModel));
  }

  getWetherFromDB() async {
    setViewState(ViewState.Busy);
    //checking for last save weather details
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    String weatherFromPrefs = _sharedPreferences.getString("weather");
    // if weather details exist update weather detail
    if (weatherFromPrefs != null)
      weatherModel = weatherModelFromJson(weatherFromPrefs);
    setViewState(ViewState.Idle);
  }
}
