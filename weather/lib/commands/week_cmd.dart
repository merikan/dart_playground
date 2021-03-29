import 'package:weather/commands/weather_cmd.dart';
import 'package:weather/model/weather_model.dart';

class WeekCmd extends WeatherCmd {
  final name = 'week';
  final description = 'Prints weather for the week in a given city';
  final loadingMessage = 'looking for the weekly weather in';

  @override
  Future<List<Weather>> getWeather(String city) async {
    return await WeatherCmd.weatherApi.getWeather(city);
  }
}
