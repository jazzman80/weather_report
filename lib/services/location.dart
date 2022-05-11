import 'package:geolocator/geolocator.dart';

class Location {
  double _longitude = 0;
  double _latitude = 0;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      _latitude = position.latitude;
      _longitude = position.longitude;
    } catch (exception) {}
  }

  double getLatitude() => _latitude;
  double getLongitude() => _longitude;
}
