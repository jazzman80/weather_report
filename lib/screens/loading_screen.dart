import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_report/services/weather_data.dart';
import 'location_screen.dart';
import 'package:weather_report/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getWeatherData() async {
    Weather weather = Weather();

    WeatherData weatherData = await weather.getDataByLocation();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          weatherData: weatherData,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitWave(
        color: Colors.lightBlue,
        size: 100.0,
      ),
    );
  }
}
