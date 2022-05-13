import 'package:flutter/material.dart';
import 'package:weather_report/services/location.dart';
import 'package:weather_report/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

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
    getCurrentLocation();
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
