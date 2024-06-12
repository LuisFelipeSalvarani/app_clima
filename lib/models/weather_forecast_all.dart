import 'package:app_clima/models/weather_forecast_current.dart';
import 'package:app_clima/models/weather_forecast_daily.dart';

class WeatherForecastAll {
  WeatherCurrent? weather_current;
  WeatherForecast? weather_forecast;

  WeatherForecastAll({
    this.weather_current,
    this.weather_forecast
  });

  WeatherForecastAll.fromJson(Map<String, dynamic> json){
    weather_current = json['weather_current'] != null ? WeatherCurrent.fromJson(json['weather_current']) : null;
    weather_forecast = json['weather_forecast'] != null ? WeatherForecast.fromJson(json['weather_forecast']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (weather_current != null) {
      data['weather_current'] = weather_current!.toJson();
    }
    if (weather_forecast != null) {
      data['weather_forecast'] = weather_forecast!.toJson();
    }
    return data;
  }
}