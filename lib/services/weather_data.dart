import 'package:flutter/material.dart';

class WeatherData {
  final String temperature;
  final String name;
  final IconData icon;

  WeatherData({
    required this.temperature,
    required this.name,
    required this.icon,
  });
}
