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
        '$kOpenWeatherMapsUrl?lat=$_latitude&lon=$_longitude&appid=$kOpenWeatherMapsApiKey');
    _response = await http.get(_url);

    if (_response.statusCode == 200) {
      var decoded = jsonDecode(_response.body);
      return WeatherData(
        temperature: decoded['main']['temp'],
        name: decoded['name'],
      );
    } else {
      return WeatherData(
        temperature: 100.0,
        name: 'Moscow',
      );
    }
  }
}

class WeatherData {
  final double temperature;
  final String name;

  WeatherData({required this.temperature, required this.name});
}
