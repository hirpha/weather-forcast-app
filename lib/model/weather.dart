class Weather {
  String? mainWeather;
  String? maindescription;
  String? temp;
  String? pressure;
  String? clouds;
  String? humidity;
  String? countryName;
  String? windSpeed;

  Weather({
    required this.countryName,
    required this.mainWeather,
    required this.maindescription,
    required this.pressure,
    required this.clouds,
    required this.humidity,
    required this.windSpeed,
    required this.temp,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      countryName: json["name"],
      mainWeather: json["weather"][0]['main'],
      maindescription: json["weather"][0]['description'],
      pressure: json["main"]['pressure'].toString(),
      windSpeed: json["wind"]['speed'].toString(),
      humidity: json["main"]['humidity'].toString(),
      clouds: json["clouds"]['all'].toString(),
      temp: json["main"]['temp'].toString(),
    );
  }
}
