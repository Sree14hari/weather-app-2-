import 'package:flutter/material.dart';
import 'package:weather_app/models/httpfunctions.dart';
import 'package:weather_app/widgets/additional_info.dart';
import 'package:weather_app/widgets/swipecards.dart';
import 'package:weather_app/widgets/weather_card.dart';

class Weatherscreen extends StatefulWidget {
  const Weatherscreen({super.key});

  @override
  State<Weatherscreen> createState() => _WeatherscreenState();
}

class _WeatherscreenState extends State<Weatherscreen> {
  @override
  void initState() {
    super.initState();
    Httpfunctions httpfunctions = Httpfunctions();
    httpfunctions.getcurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_outlined),
              onPressed: () {
                // *Action for settings button
              },
            ),
          ],
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*weather card
            WeatherCard(),

            //*scrollable cards
            Swipecards(),

            //*additional info
            AdditionalInfo(),
          ],
        ),
      ),
    );
  }
}
