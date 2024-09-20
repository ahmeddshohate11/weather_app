import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

const String apiKey = "8ab96681ff5d435b9ae03200242103";

class WeatherService {
  final Dio dio;

  final String baseurl = 'https://api.weatherapi.com/v1';

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseurl/forecast.json?key=$apiKey&q=$cityName&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there is an error, please try again later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there is an error, please try again later');
    }
  }
}


  // final String apikey = '8ab96681ff5d435b9ae03200242103'


  // import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:weather_app/models/weather_model.dart';

// class WeatherServices {
//   final Dio dio;
//   final String baseUrl = 'https://api.weatherapi.com/v1';
//   final String apikey = '8ab96681ff5d435b9ae03200242103';

//   WeatherServices(this.dio);

//   Future<WeatherModel> getCurrentWeather({required String cityName}) async {
//     //ده دايما لازم يتحط جوا try and catch
//     try {
//       Response response = await dio
//           .get('$baseUrl/forecast.json?key=$apikey&q=$cityName&days=1');
//       WeatherModel weatherModel = WeatherModel.fromJson(response.data);
//       return weatherModel;
//     } on DioException catch (e) {
//       final String errorMesssage = e.response?.data['error']['message'] ??
//           'oops there was an error, try ';
//       throw Exception(errorMesssage);  

//       // TODO
//     } catch (e) {
//       log(e.toString());
//       throw Exception('oops there was an error, try later');
//     }
//     //لعند هنا
//   }
// }
 // final String apikey = '8ab96681ff5d435b9ae03200242103'