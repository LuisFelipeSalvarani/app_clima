import 'package:app_clima/models/coord.dart';
import 'package:app_clima/models/temp.dart';
import 'package:app_clima/models/weather.dart';
import 'package:app_clima/models/wind.dart';

class WeatherForecast {
  Coord? coord;
  List<Weather>? weather;
  Temp? temp;
  int? visibility;
  Wind? wind;
  int? clounds;
  int? dt;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherForecast(
      {this.coord,
      this.weather,
      this.temp,
      this.visibility,
      this.wind,
      this.clounds,
      this.dt,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    temp = json['main'] != null ? Temp.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['main'] != null ? Wind.fromJson(json['main']) : null;
    clounds = json['clounds'];
    dt = json['dt'];
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data['cood'] = coord!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (temp != null) {
      data['temp'] = temp!.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['temp'] = wind!.toJson();
    }
    data['clounds'] = clounds;
    data['dt'] = dt;
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}
