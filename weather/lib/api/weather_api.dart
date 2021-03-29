import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/model/weather_model.dart';

class WeatherApi {
  static const ID_URL =
      "https://www.metaweather.com/api/location/search/?query=[0]";
  static const API_URL = "https://www.metaweather.com/api/location/[0]/";

  Future<int> getCityId(String city) async {
    var url = ID_URL.replaceAll('[0]', city);
    var res = await http.get(url);

    var json = jsonDecode(res.body);
    if ((json as List).isEmpty) {
      throw Exception('Cannot find City\n');
    }
    return json[0]['woeid'];
  }

  Future<List<Weather>> getWeather(String city) async {
    var id = await getCityId(city);
    var url = API_URL.replaceAll('[0]', id.toString());
    var res = await http.get(url);

    var json = jsonDecode(res.body);
    List<Weather> weather = [];

    (json['consolidated_weather'] as List<dynamic>)
      ..forEach(
        (j) => weather.add(Weather.fromJson(j)),
      );

    return weather;
  }
}
