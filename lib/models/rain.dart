class Rain {
  double? rain;

  Rain({this.rain});

  Rain.fromJson(Map<String, dynamic> json) {
    if(json['3h'] != null) {
      rain = json['3h'];
    } else {
      rain = json['1h'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rain'] = rain;
    return data;
  }
}
