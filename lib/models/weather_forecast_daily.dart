import 'package:app_clima/models/city.dart';
import 'package:app_clima/models/weather_list.dart';

class WeatherForecast {
  List<WeatherList>? list;
  City? city;

  WeatherForecast({
    this.list,
    this.city
  });

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      List<WeatherList> rawList = <WeatherList>[];
      json['list'].forEach((v) {
        rawList.add(WeatherList.fromJson(v));
      });
      // Filtrar a lista para ter apenas uma previsão por dia
      list = filterDailyForecasts(rawList);
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }

  List<WeatherList> filterDailyForecasts(List<WeatherList> rawList) {
    final Map<String, WeatherList> dailyForecasts = {};
    final Map<String, WeatherList> closestForecasts = {};

    for (var forecast in rawList) {
      // Extrair a data e a hora da previsão
      List<String> dateTimeParts = forecast.dt_txt!.split(' ');
      String date = dateTimeParts[0];
      String time = dateTimeParts[1];

      // Priorizar a previsão para as 12:00:00
      if (time == '12:00:00') {
        dailyForecasts[date] = forecast;
      } else {
        // Guardar a previsão mais próxima de 12:00:00, caso não haja uma exatamente às 12:00:00
        if (!closestForecasts.containsKey(date) || (time.compareTo('12:00:00') < 0 && closestForecasts[date]!.dt_txt!.split(' ')[1].compareTo(time) > 0)) {
          closestForecasts[date] = forecast;
        }
      }
    }

    // Adicionar previsões mais próximas de 12:00:00 para os dias que não possuem previsão exata às 12:00:00
    closestForecasts.forEach((date, forecast) {
      if (!dailyForecasts.containsKey(date)) {
        dailyForecasts[date] = forecast;
      }
    });

    // Retornar a lista filtrada de previsões diárias
    return dailyForecasts.values.toList();
  }
}