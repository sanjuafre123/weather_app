import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Weather/Screen/Weather/saved_screen.dart';
import '../../model/locationData_Model.dart';
import '../../model/main_model.dart';
import '../../provider/weather_provider.dart';
import 'components/glass_container.dart';
import 'components/weather_appBar.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key, this.initialCity}) : super(key: key);

  final String? initialCity;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => WeatherProvider(),
        child: Consumer<WeatherProvider>(
          builder: (context, weatherProvider, _) {
            final height = MediaQuery.of(context).size.height;
            final width = MediaQuery.of(context).size.width;

            if (initialCity != null &&
                initialCity!.isNotEmpty &&
                weatherProvider.weather == null) {
              weatherProvider.fetchData(initialCity!);
            }

            String backgroundImage = 'assets/blue-fly.gif'; // Default image
            if (weatherProvider.weather != null) {
              String condition = weatherProvider
                  .weather!.currentModal.conditionModel.text
                  .toLowerCase();
              if (condition.contains('partly cloudy')) {
                backgroundImage = 'assets/cloudthunder.gif';
              } else if (condition.contains('rain')) {
                backgroundImage = 'assets/rain.gif';
              } else if (condition.contains('fair')) {
                backgroundImage = 'assets/blue-fly.gif';
              } else if (condition.contains('cloudy')) {
                backgroundImage = 'assets/cloudy.gif';
              }
              // Add more conditions as needed
            }

            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(backgroundImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: (weatherProvider.isLoading)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            wetherAppBar(context, width),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: searchController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                              Colors.white.withOpacity(0.5),
                                          hintText: 'Search',
                                          hintStyle: TextStyle(color: Colors.white),
                                          prefixIcon: Icon(
                                              Icons.location_on_sharp,
                                              color: Colors.white),
                                          suffixIcon: IconButton(
                                            icon: Icon(Icons.search,
                                                color: Colors.white),
                                            onPressed: () async {
                                              weatherProvider.fetchData(
                                                  searchController.text);
                                              searchController.clear();
                                            },
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 15.0, horizontal: 20.0),
                                        ),
                                        onSubmitted: (value) async {
                                          weatherProvider.fetchData(value);
                                          searchController.clear();
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Card(
                                        color: Colors.white24,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            ListTile(
                                              title: Text(
                                                '${weatherProvider.weather!.locationModal.name}, ${weatherProvider.weather!.locationModal.region},',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              subtitle: Text(
                                                '${weatherProvider.weather?.locationModal.country} | ${weatherProvider.weather?.locationModal.localtime}',
                                                style: TextStyle(
                                                    height: 3,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Card(
                                        color: Colors.white24,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ListTile(
                                              title: Text(
                                                'Current Weather',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              subtitle: Text(
                                                '${weatherProvider.weather?.locationModal.country}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              trailing: Image.network(
                                                'https:${weatherProvider.weather?.currentModal.conditionModel.icon}',
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text('Temp',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      Text(
                                                          '${weatherProvider.weather?.currentModal.tempC} °C',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text('Feels Like',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      Text(
                                                          '${weatherProvider.weather?.currentModal.feelsLikeC} °C',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text('Humidity',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      Text(
                                                          '${weatherProvider.weather?.currentModal.humidity} %',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        color: Colors.white24,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ListTile(
                                              title: Text('Hourly Forecast',style: TextStyle(color: Colors.white),),
                                            ),
                                            Container(
                                              height: 120,
                                              child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: weatherProvider.weather!.weatherForecast.forecastday.first.hour.length,
                                                itemBuilder: (context, index) {
                                                  var hour = weatherProvider.weather!.weatherForecast.forecastday.first.hour[index];
                                                  return Container(
                                                    width: 80.0,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            '${hour.time.split(' ')[1]}',style: TextStyle(color: Colors.white),),
                                                        Image.network(
                                                            'https:${hour.condition.icon}',),
                                                        Text('${hour.tempC} °C',style: TextStyle(color: Colors.white)),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 12),
                                      child: glassmorphicContainerTemp(
                                          height, width, weatherProvider),
                                    ),
                                    SizedBox(height: 20,),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: Colors.white54,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
              const SavedCitiesScreen(),
            ),
          );
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

GlobalKey conKey = GlobalKey();
