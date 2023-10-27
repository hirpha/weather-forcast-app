import '../model/country.dart';

int index = 0;
String lat = "";
String lng = "";
String countryName = "";

List<Country> allCountry = [];

final List<String> globalImages = [
  'assets/clouds.png',
  'assets/moon.png',
  'assets/sun.png',
];
final List<Map> onboardingTitle = [
  {
    'title': "Weather Forecast App",
    "description":
        "Get accurate and up-to-date weather information for all country"
  },
  {
    'title': "Search-Based Forecast",
    "description": "Search your country to get update weather information"
  },
  {
    'title': "Get started",
    "description": "Welcome to our weather forcast app. Register to get started"
  },
];
