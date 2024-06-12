class Temp {
  dynamic temp;
  dynamic feels_like;
  dynamic temp_min;
  dynamic temp_max;
  int? pressure;
  int? humidity;

  Temp(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity});

  Temp.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feels_like = json['feels_like'];
    temp_min = json['temp_min'];
    temp_max = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feels_like;
    data['temp_min'] = temp_min;
    data['temp_max'] = temp_max;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    return data;
  }
}
