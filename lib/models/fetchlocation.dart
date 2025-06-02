import 'package:geolocator/geolocator.dart';

class LocationService {
  double? latitude;
  double? longitude;

  // Fetch and store location
  Future<void> fetchLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      // Check permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied');
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );

      // Store in variables
      latitude = position.latitude;
      longitude = position.longitude;

      // Print the fetched location
      print('Latitude: $latitude, Longitude: $longitude');
    } catch (e) {
      print('Error fetching location: $e');
    }
  }
}
