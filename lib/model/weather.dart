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
    localtime =
        DateTime.parse(formatDateTimeLeadingZeros(location['localtime']));
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
    data['name'] = name;
    data['localtime'] = localtime;
    data['temp_c'] = tempC;
    data['is_day'] = isDay;
    data['text'] = text;
    data['icon'] = icon;
    data['wind_kph'] = windKph;
    data['humidity'] = humidity;
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

  String formatDateTimeLeadingZeros(String dateTimeString) {
    List<String> dateTimeComponents = dateTimeString.split(' ');

    if (dateTimeComponents.length == 2) {
      String datePart = dateTimeComponents[0];
      String timePart = dateTimeComponents[1];
      List<String> timeComponents = timePart.split(':');

      if (timeComponents.length == 2) {
        String hours = timeComponents[0].padLeft(2, '0');
        String minutes = timeComponents[1].padLeft(2, '0');
        String formattedDateTime = '$datePart $hours:$minutes';
        return formattedDateTime;
      }
    }
    return dateTimeString;
  }

  String getDate() {
    int month = localtime!.month - 1;
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    return "${months[month]} ${localtime!.day}";
  }
}
