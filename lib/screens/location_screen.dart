import 'package:flutter/material.dart';
import 'package:weather_report/services/networking.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key, required this.weatherData}) : super(key: key);
  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Weather in ${weatherData.name}'),
      ),
      body: Card(
        child: Text(
          '${weatherData.temperature}°${weatherData.icon}',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
