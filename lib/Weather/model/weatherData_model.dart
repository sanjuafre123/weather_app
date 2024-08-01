
import 'currentData_Model.dart';
import 'locationData_Model.dart';
import 'main_model.dart';

class Weather {
  LocationModal locationModal;
  CurrentModal currentModal;
  WeatherForecast weatherForecast;

  Weather({required this.locationModal, required this.currentModal,required this.weatherForecast});

  factory Weather.getData(Map json) {
    return Weather(
      locationModal: LocationModal.getData(json['location']),
      currentModal: CurrentModal.fromJson(json['current']),
      weatherForecast: WeatherForecast.fromJson(json['forecast']),
    );
  }
}
