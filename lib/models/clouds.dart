class Clouds {
  int? clouds;

  Clouds({this.clouds});

  Clouds.fromJson(Map<String, dynamic> json) {
    clouds = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clouds'] = clouds;
    return data;
  }
}