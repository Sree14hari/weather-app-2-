import 'package:flutter/material.dart';
import 'package:weather_app/constants/customcard.dart';

class Swipecards extends StatelessWidget {
  const Swipecards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Weather Forecast",

                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Customcard(
                    time: "1:00",
                    temperature: "200",
                    icon: Icons.cloud,
                  ),
                  Customcard(
                    time: "3:00",
                    temperature: "150",
                    icon: Icons.sunny,
                  ),
                  Customcard(
                    time: "5:00",
                    temperature: "200",
                    icon: Icons.sunny_snowing,
                  ),
                  Customcard(
                    time: "7:00",
                    temperature: "200",
                    icon: Icons.thunderstorm,
                  ),
                  Customcard(
                    time: "9:00",
                    temperature: "100",
                    icon: Icons.thunderstorm_sharp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
