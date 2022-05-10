import 'package:flutter/material.dart';
import 'package:weather_report/screens/loading_screen.dart';

void main() => runApp(
      const WeatherReportApplication(),
    );

class WeatherReportApplication extends StatelessWidget {
  const WeatherReportApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
