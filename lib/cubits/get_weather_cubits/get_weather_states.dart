import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLLoadedSate extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLLoadedSate(this.weatherModel);
}

class WeatherFailures extends WeatherState {
  final String errMessage;

  WeatherFailures(this.errMessage);
}
