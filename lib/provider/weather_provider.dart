import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/model/country.dart';

import '../model/weather.dart';
import '../repository/weather_repo.dart';

final countryDataProvider = FutureProvider<List<Country>>((ref) async {
  return ref.read(apiProvider).getAllCountry();
});
final countryDetailProvider = FutureProvider<Weather>((ref) async {
  return ref.read(apiProvider).getAllCountryDetail();
});
