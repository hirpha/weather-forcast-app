class Country {
  final String official;
  final String name;
  final String capital;
  final String latitude;
  final String longitude;
  final String temperature;
  Country({
    required this.capital,
    required this.name,
    required this.latitude,
    required this.official,
    required this.longitude,
    required this.temperature,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      official: json["name"]["official"],
      name: json["name"]["common"],
      capital:
          json["capital"] != null ? json["capital"][0] : json["name"]['common'],
      latitude: json['latlng'][0].toString(),
      longitude: json['latlng'][1].toString(),
      temperature: "json['weather']['temperature'].toString()",
    );
  }
}
