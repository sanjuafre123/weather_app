
import 'package:flutter/material.dart';

import '../../../provider/weather_provider.dart';


Column weatherImage(double height,WeatherProvider weatherProvider) {
  return Column(
    children: [
      SizedBox(
        height: height * 0.05,
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: height * 0.15,
          child: Image.network(
            'https:${weatherProvider.weather!.currentModal.conditionModel.icon}',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        height: height * 0.05,
      ),
    ],
  );
}
