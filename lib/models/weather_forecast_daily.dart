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
      list = <WeatherList>[];
      json['list'].forEach((v) {
        list!.add(WeatherList.fromJson(v));
      });
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
}
