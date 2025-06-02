import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/httpfunctions.dart';

class WeatherCard extends StatefulWidget {
  WeatherCard({super.key, this.tempe, this.status});
  String? tempe;
  String? status;

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: Httpfunctions().getcurrentWeather(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(32.0),
            child: Center(child: CircularProgressIndicator.adaptive()),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        }

        final tempe = snapshot.data!["temp"].toStringAsFixed(2);
        final status = snapshot.data!["status"];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: Card(
              elevation: 2,
              shadowColor: const Color.fromARGB(255, 28, 28, 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tempe,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Icon(
                    CupertinoIcons.cloud_sun_fill,
                    size: 50,
                    color: const Color.fromARGB(255, 210, 210, 210),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    status,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 237, 237, 237),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
