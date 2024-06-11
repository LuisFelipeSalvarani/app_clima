class Rain {
  double? rain;

  Rain({this.rain});

  Rain.fromJson(Map<String, dynamic> json) {
    rain = json['3h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rain'] = rain;
    return data;
  }
}