import 'dart:convert';
import 'dart:developer';

import 'package:app_clima/models/weather_forecast_all.dart';
import 'package:app_clima/models/weather_forecast_current.dart';
import 'package:app_clima/models/weather_forecast_daily.dart';
import 'package:app_clima/utilities/constants.dart';
import 'package:app_clima/utilities/location.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecastAll> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String?> parameters;

    if (isCity == true) {
      var queryParameters = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName,
        'lang': 'pt_br',
      };

      parameters = queryParameters;
    } else {
      var queryParameters = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
        'lang': 'pt_br',
      };

      parameters = queryParameters;
    }

    var forecastUri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH_FORECAST, parameters);
    var currentUri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH_CURRENT, parameters);

    log('Requisição Previsão: ${forecastUri.toString()}');
    log('Requisição Atual: ${currentUri.toString()}');

    var response = await Future.wait([http.get(forecastUri), http.get(currentUri)]);

    var forecastResponse = response[0];
    var currentResponse = response[1];

    print('Resposta Previsão: ${forecastResponse.body}');
    print('Resposta Atual: ${currentResponse.body}');

    if (forecastResponse.statusCode == 200 && currentResponse.statusCode == 200) {
      var forecastData = json.decode(forecastResponse.body);
      var currentData = json.decode(currentResponse.body);
      var weatherForecastResponse = {
        'weather_forecast': forecastData,
        'weather_current': currentData,
      };

      return WeatherForecastAll.fromJson(weatherForecastResponse);
    } else {
      throw Future.error('Erro na resposta');
    }
  }
}
