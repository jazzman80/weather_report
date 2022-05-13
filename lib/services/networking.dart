import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_report/utilities/constants.dart';
import 'dart:convert';

class Networking {
  http.Response _response = http.Response('body', 200);
  final double _latitude;
  final double _longitude;

  Networking(this._latitude, this._longitude);

  Future<WeatherData> getData() async {
    Uri _url = Uri.parse(
        '$kOpenWeatherMapsUrl?lat=$_latitude&lon=$_longitude&appid=$kOpenWeatherMapsApiKey&units=$kOpenWeatherMapUnits');
    _response = await http.get(_url);

    if (_response.statusCode == 200) {
      var decoded = jsonDecode(_response.body);
      double temperatureAsDouble = decoded['main']['temp'];
      int weatherId = decoded['weather'][0]['id'];
      print(weatherId);
      return WeatherData(
        temperature: temperatureAsDouble.toStringAsFixed(0),
        name: decoded['name'],
        icon: getWeatherIcon(weatherId),
      );
    } else {
      return WeatherData(
        temperature: '100.0',
        name: 'Moscow',
        icon: '☀',
      );
    }
  }

  String getWeatherIcon(int weatherId) {
    if (weatherId < 299) {
      return '⛈';
    } else if (weatherId < 499) {
      return '🌦️';
    } else if (weatherId < 599) {
      return '🌧️';
    } else if (weatherId < 699) {
      return '❄';
    } else if (weatherId < 799) {
      return '🌫️';
    } else if (weatherId == 800) {
      return '☀️';
    } else if (weatherId < 803) {
      return '🌤️';
    } else {
      return '☁';
    }
  }
}

class WeatherData {
  final String temperature;
  final String name;
  final String icon;

  WeatherData({
    required this.temperature,
    required this.name,
    required this.icon,
  });
}
