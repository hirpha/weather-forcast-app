import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/constants/global_variable.dart';
import '../model/country.dart';
import '../model/weather.dart';

class ApiService {
  String searchCountryByNameUrl =
      "https://restcountries.com/v3.1/name/$countryName?fullText=true";
  String countryEndpoint = "https://restcountries.com/v3.1/all";
  String countryDetailEndpoint = "https://api.openweathermap.org/data/2.5/";
  String weatherApiKey = "2a63928ffc5d230c155fbafe5fbf779f";
  Dio dio = Dio();

  Future<List<Country>> getAllCountry() async {
    searchCountryByNameUrl =
        "https://restcountries.com/v3.1/name/$countryName?fullText=true";
    Response response = await dio
        .get(countryName.isNotEmpty ? searchCountryByNameUrl : countryEndpoint);
    if (response.statusCode == 200) {
      final List result = response.data;
      if (result.length > 1) {
        allCountry = result.map(((e) => Country.fromJson(e))).toList();
      } else {
        allCountry = allCountry;
      }
      return result.length > 1
          ? allCountry
          : result.map(((e) => Country.fromJson(e))).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }

  Future<Weather> getAllCountryDetail() async {
    Response response = await dio.get(
        "${countryDetailEndpoint}weather?lat=$lat&lon=$lng&appid=$weatherApiKey");
    if (response.statusCode == 200) {
      return Weather.fromJson(response.data);
    } else {
      throw Exception(response.statusMessage);
    }
  }
}

//API SERVICE Provider
final apiProvider = Provider<ApiService>((ref) => ApiService());
