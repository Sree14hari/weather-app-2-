import 'package:flutter/material.dart';
import 'package:weather_app/constants/addinfocard.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({super.key});

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
              child: Text(
                "Additional Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Addinfocard(
                    title: "humidity",
                    icon: Icons.water_drop_outlined,
                    value: 60,
                  ),
                  const SizedBox(width: 10),
                  Addinfocard(
                    title: "windspeed",
                    icon: Icons.wind_power,
                    value: 60,
                  ),
                  const SizedBox(width: 10),
                  Addinfocard(
                    title: "preasure",
                    icon: Icons.umbrella,
                    value: 60,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
