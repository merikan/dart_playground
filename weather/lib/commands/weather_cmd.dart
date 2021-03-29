import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/model/weather_model.dart';

abstract class WeatherCmd extends Command {
  String loadingMessage;
  static WeatherApi weatherApi = WeatherApi();

  Future<List<Weather>> getWeather(String city);

  @override
  Future<void> run() async {
    if (argResults.arguments.isEmpty) {
      throw Exception('City argument os required');
    }
    final city = argResults.arguments[0];
    final loadingString = '${loadingMessage} ${city}\n';

    stdout.write('${loadingString}');
    var weather = await getWeather(city);
    stdout.writeAll(weather);
  }
}
