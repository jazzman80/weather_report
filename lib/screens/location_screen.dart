import 'package:flutter/material.dart';
import 'package:weather_report/services/networking.dart';
import 'package:weather_report/services/location.dart';
import 'city_screen.dart';

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

//TODO: refactor this repeat
  void updateWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    Networking networking = Networking(
      location.getLatitude(),
      location.getLongitude(),
    );

    _weatherData = await networking.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.explore),
          onPressed: () => updateWeatherData(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityScreen(),
                ),
              );
            },
            icon: Icon(Icons.location_city),
          )
        ],
        title: Text(
          'Weather in ${_weatherData.name}',
        ),
      ),
      body: Card(
        child: Row(
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
