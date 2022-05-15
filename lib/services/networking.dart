import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_report/utilities/constants.dart';
import 'dart:convert';
import 'package:weather_report/services/weather_data.dart';

class Networking {
  Future<WeatherData> getData(Uri url) async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      double temperatureAsDouble = decoded['main']['temp'];
      int weatherId = decoded['weather'][0]['id'];
      return WeatherData(
        temperature: temperatureAsDouble.toStringAsFixed(0),
        name: decoded['name'],
        icon: getWeatherIcon(weatherId),
      );
    } else {
      return WeatherData(
        temperature: '100.0',
        name: 'Moscow',
        icon: Icons.cloud,
      );
    }
  }

  IconData getWeatherIcon(int weatherId) {
    if (weatherId < 299) {
      return Icons.bolt;
    } else if (weatherId < 499) {
      return Icons.water_drop;
    } else if (weatherId < 599) {
      return Icons.water_drop;
    } else if (weatherId < 699) {
      return Icons.cloudy_snowing;
    } else if (weatherId < 799) {
      return Icons.lens_blur_outlined;
    } else if (weatherId == 800) {
      return Icons.sunny;
    } else if (weatherId < 803) {
      return Icons.wb_cloudy_outlined;
    } else {
      return Icons.wb_cloudy;
    }
  }
}
