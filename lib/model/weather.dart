class Weather {
  String? name;
  String? localtime;
  double? tempC;
  int? isDay;
  String? text;
  String? icon;
  double? windKph;
  double? humidity;

  Weather(
      {this.name,
      this.localtime,
      this.tempC,
      this.isDay,
      this.text,
      this.icon,
      this.windKph,
      this.humidity});

  Weather.fromJson(Map json) {
    name = json['name'];
    localtime = json['localtime'];
    tempC = json['temp_c'];
    isDay = json['is_day'];
    text = json['text'];
    icon = json['icon'];
    windKph = json['wind_kph'];
    humidity = json['humidity'];
  }

  Map toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['localtime'] = this.localtime;
    data['temp_c'] = this.tempC;
    data['is_day'] = this.isDay;
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['wind_kph'] = this.windKph;
    data['humidity'] = this.humidity;
    return data;
  }
}
