import 'package:geolocator/geolocator.dart';

class Location {
  late final double _longitude;
  late final double _latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      _latitude = position.latitude;
      _longitude = position.longitude;
    } catch (exception) {
      _latitude = 0;
      _longitude = 0;
    }
  }

  double getLatitude() => _latitude;
  double getLongitude() => _longitude;
}
