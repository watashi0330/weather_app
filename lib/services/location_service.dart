// ignore_for_file: prefer_const_constructors

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  // Request location permission
  Future<bool> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    return status.isGranted;
  }

  // Get the current location using new LocationSettings
  Future<Position?> getCurrentLocation() async {
    try {
      // Check if permission is granted
      bool isPermissionGranted = await requestLocationPermission();
      if (!isPermissionGranted) {
        return null;
      }

      // Define location settings
      LocationSettings locationSettings = LocationSettings(
        accuracy:
            LocationAccuracy.best, // You can use LocationAccuracy.high or best
        distanceFilter:
            10, // Minimum distance to trigger a location update in meters
      );

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      return position;
    } catch (e) {
      print("Error getting location: $e");
      return null;
    }
  }
}
