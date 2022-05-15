import 'dart:html';

import 'package:weather_report/services/networking.dart';
import 'package:weather_report/services/weather_data.dart';
import 'package:weather_report/utilities/constants.dart';
import 'package:weather_report/services/location.dart';

class Weather {
  Future<WeatherData> getDataByLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    double latitude = location.getLatitude();
    double longitude = location.getLongitude();

    Uri url = Uri.parse(
        '$kOpenWeatherMapsUrl?lat=$latitude&lon=$longitude&appid=$kOpenWeatherMapsApiKey&units=$kOpenWeatherMapUnits');
    Networking networking = Networking();

    return await networking.getData(url);
  }

  Future<WeatherData> getDataByCity(String cityName) async {
    Uri url = Uri.parse(
        '$kOpenWeatherMapsUrl?q=$cityName&appid=$kOpenWeatherMapsApiKey&units=$kOpenWeatherMapUnits');

    Networking networking = Networking();

    return await networking.getData(url);
  }
}
