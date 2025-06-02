import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customcard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;
  const Customcard({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,

      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Icon(
                icon,
                size: 50,
                color: const Color.fromARGB(255, 209, 209, 209),
              ),
              SizedBox(height: 10),
              Text(
                temperature,
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(137, 208, 208, 208),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
