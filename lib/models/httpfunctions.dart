import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/fetchlocation.dart';

class Httpfunctions {
  String apikey = "";
  LocationService locationService = LocationService();

  Future<Map<String, dynamic>> getcurrentWeather() async {
    try {
      // Fetch location first
      await locationService.fetchLocation();
      final lat = locationService.latitude;
      final lon = locationService.longitude;

      if (lat == null || lon == null) {
        throw Exception('Could not fetch location.');
      }

      final res = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apikey",
        ),
      );
      final data = jsonDecode(res.body);
      if (int.parse(data["cod"]) != 200) {
        throw Exception('Error fetching weather data: ');
      }

      double tempe = data["list"][0]["main"]["temp"] - 273.15;
      String status = data["list"][0]["weather"][0]["main"];

      return {"temp": tempe, "status": status};
    } catch (e) {
      print('Error fetching weather data: $e');
      rethrow;
    }
  }
}
