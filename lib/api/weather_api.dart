import 'dart:convert';
import 'dart:developer';

import 'package:app_clima/models/weather_forecast_daily.dart';
import 'package:app_clima/utilities/constants.dart';
import 'package:app_clima/utilities/location.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String?> parameters;

    if (isCity == true) {
      var queryParameters = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName,
        'lang': 'pt_br'
      };

      parameters = queryParameters;
    } else {
      var queryParameters = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
        'lang': 'pt_br'
      };

      parameters = queryParameters;
    }

    var uri = Uri.https(
      Constants.WEATHER_BASE_URL_DOMAIN,
      Constants.WEATHER_FORECAST_PATH,
      parameters,
    );

    log('requisição: ${uri.toString()}');

    var response = await http.get(uri);

    print('resposta: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Future.error('Erro na resposta');
    }
  }
}
