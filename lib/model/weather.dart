class Weather {
  String? name;
  DateTime? localtime;
  double? tempC;
  int? isDay;
  String? text;
  String? icon;
  double? windKph;
  int? humidity;

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
    Map location = json["location"];
    name = location['name'];
    localtime = DateTime.parse(location['localtime']);
    Map current = json['current'];
    tempC = current['temp_c'];
    isDay = current['is_day'];
    Map condition = current["condition"];
    text = condition['text'];
    icon = condition['icon'];
    humidity = current['humidity'];
    windKph = current['wind_kph'];
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

  String formatTime(DateTime dateTime) {
    String period = 'am';
    int hour = dateTime.hour;

    if (hour >= 12) {
      period = 'pm';
      if (hour > 12) {
        hour -= 12;
      }
    }
    String minutes = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minutes $period';
  }
}
