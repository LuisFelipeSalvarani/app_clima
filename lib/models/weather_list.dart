import 'package:app_clima/models/clouds.dart';
import 'package:app_clima/models/rain.dart';
import 'package:app_clima/models/temp.dart';
import 'package:app_clima/models/weather.dart';
import 'package:app_clima/models/wind.dart';

class WeatherList {
  int? dt;
  Temp? temp;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Rain? rain;

  WeatherList({
    this.dt,
    this.temp,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain
  });

  WeatherList.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = json['main'] != null ? Temp.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    if (temp != null) {
      data['temp'] = temp!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    data['visibility'] = visibility;
    data['pop'] = pop;
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    return data;
  }
}