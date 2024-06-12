import 'package:app_clima/models/clouds.dart';
import 'package:app_clima/models/coord.dart';
import 'package:app_clima/models/rain.dart';
import 'package:app_clima/models/temp.dart';
import 'package:app_clima/models/weather.dart';
import 'package:app_clima/models/wind.dart';

class WeatherCurrent {
  Coord? coord;
  List<Weather>? weather;
  Temp? temp;
  int? visibility;
  Wind? wind;
  Rain? rain;
  Clouds? clouds;
  int? dt;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherCurrent({
    this.coord,
    this.weather,
    this.temp,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.timezone,
    this.id,
    this.name,
    this.cod
  });

  WeatherCurrent.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    temp = json['main'] != null ? Temp.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (temp != null) {
      data['temp'] = temp!.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['dt'] = dt;
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}