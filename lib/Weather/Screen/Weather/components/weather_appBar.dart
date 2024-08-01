
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/weather_provider.dart';


Row wetherAppBar(BuildContext context, double width) {
  return Row(
    children: [
      SizedBox(
        height: 80,
      ),
      SizedBox(
        width: width * 0.04,
      ),
      Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          return Text(
            weatherProvider.weather!.locationModal.name.toString(),
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          );
        },
      ),
      SizedBox(
        width: width * 0.03,
      ),
      Spacer(),

      SizedBox(
        width: width * 0.06,
      ),
      Icon(
        Icons.settings,
        size: 25,
        color: Colors.white,
      ),
      SizedBox(
        width: width * 0.04,
      ),
    ],
  );
}