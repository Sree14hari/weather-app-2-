import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Card;

class Addinfocard extends StatelessWidget {
  final dynamic title;

  final dynamic icon;

  final dynamic value;

  const Addinfocard({super.key, this.title, this.icon, this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 50,
                color: const Color.fromARGB(255, 209, 209, 209),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                value.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(135, 255, 242, 242),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
