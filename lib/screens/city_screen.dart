import 'package:flutter/material.dart';
import 'package:weather_report/services/weather_data.dart';
import 'package:weather_report/services/weather.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String _cityName;
    late WeatherData _weatherData;

    Future<void> updateWeatherData() async {
      Weather weather = Weather();

      _weatherData = await weather.getDataByCity(_cityName);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select city'),
      ),
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                icon: Icon(Icons.location_city),
                hintText: 'Enter city name',
              ),
              onChanged: (value) {
                _cityName = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 50.0,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  await updateWeatherData();
                  Navigator.pop(context, _weatherData);
                },
                child: const Text('Select city'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
