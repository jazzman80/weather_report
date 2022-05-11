import 'package:flutter/material.dart';
import 'package:weather_report/services/location.dart';
import 'package:weather_report/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getCurrentLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    Networking networking = Networking(
      location.getLatitude(),
      location.getLongitude(),
    );

    WeatherData weatherData = await networking.getData();
    print(
      (weatherData.temperature - 273.15).toStringAsFixed(0),
    );
    print(weatherData.name);
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
