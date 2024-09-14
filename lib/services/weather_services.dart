import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apikey = '8ab96681ff5d435b9ae03200242103';

  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    //ده دايما لازم يتحط جوا try and catch
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apikey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMesssage = e.response?.data['error']['message'] ??
          'oops there was an error, try ';
      throw Exception(errorMesssage);  

      // TODO
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
    //لعند هنا
  }
}
