import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best)
          .timeout(const Duration(seconds: 40));

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      log('Algo de errado aconteceu: $e');
    }
  }
}
