import 'package:flutter/material.dart';
import 'city_screen.dart';
import 'package:weather_report/services/weather.dart';
import 'package:weather_report/services/weather_data.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, required this.weatherData}) : super(key: key);
  final WeatherData weatherData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late WeatherData _weatherData;

  @override
  void initState() {
    super.initState();
    _weatherData = widget.weatherData;
  }

  void updateWeatherData() async {
    Weather weather = Weather();
    _weatherData = await weather.getDataByLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.explore),
          onPressed: () => updateWeatherData(),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              _weatherData = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CityScreen(),
                ),
              );
              setState(() {});
            },
            icon: const Icon(Icons.location_city),
          )
        ],
        title: Text(
          'Weather in ${_weatherData.name}',
        ),
      ),
      body: Card(
        margin: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_weatherData.temperature}°',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Icon(
              _weatherData.icon,
              size: 100.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
