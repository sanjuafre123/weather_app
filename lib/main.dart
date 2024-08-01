import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Weather/provider/weather_provider.dart';
import 'Weather/Screen/Weather/Weather_Screen.dart';
import 'Weather/Screen/splashscreen/SplashScreen.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider(),)
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => const SplashScreen(),
          '/Weather' : (context) =>  const WeatherScreen(),
        },
      ),
    );
  }
}
