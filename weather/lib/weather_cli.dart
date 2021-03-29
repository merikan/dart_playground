import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:weather/commands/now_cmd.dart';
import 'package:weather/commands/week_cmd.dart';

Future<void> weatheCLI(List<String> args) async {
  final runner = CommandRunner('weather', 'Dart Weather CLI');

  runner
    ..addCommand(
      NowCmd(),
    )
    ..addCommand(
      WeekCmd(),
    );

    return await runner.run(args).catchError((e) {
      stdout.write('${e ?? "An error Occurred"}');
      exitCode = 1;
    });
}
