
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/weather_provider.dart';


class CityDetailScreen extends StatelessWidget {
  const CityDetailScreen({Key? key, required this.cityName}) : super(key: key);

  final String cityName;

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);
    final weatherDetails = weatherProvider.getWeatherDetailsForCity(cityName);

    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
      ),
      body: weatherDetails == null
          ? Center(child: Text('No weather data available for $cityName'))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weather Details for $cityName',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Temperature: ${weatherDetails.currentModal.tempC}°C'),
            Text('Condition: ${weatherDetails.currentModal.conditionModel.text}'),
            // You can add more weather details here if needed
          ],
        ),
      ),
    );
  }
}
