import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';

import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  late WeatherModel weatherModel;

  Future<void> getWeather({required String cityName}) async {
    try {
     weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);

      emit(WeatherLLoadedSate(weatherModel));
    } catch (e) {
      emit(WeatherFailures(
        e.toString(),
      ));
    }
  }
}
