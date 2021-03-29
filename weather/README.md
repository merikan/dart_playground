A sample command-line application fetching the weather from (https://www.metaweather.com)

## Build and run
PreReq: Dart is installed
### Checkout
```
$ git checkout https://github.com/merikan/dart_playground.git
```
### Run 
#### with help
```
$ cd weather
$ dart ./bin/weather.dart
Dart Weather CLI

Usage: weather <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  now    Prints weather for right now at a given city
  week   Prints weather for the week in a given city

Run "weather help <command>" for more information about a command.
```

#### check London weather today
```
$ dart ./bin/weather.dart now london
looking for the current weather in london
Date: 2021-03-29, Temp: 17.12C, Min temp: 9.02C, Max temp: 18.34C
```

#### check london weather this week
```
$ dart ./bin/weather.dart week london
looking for the weekly weather in london
Date: 2021-03-29, Temp: 17.12C, Min temp: 9.02C, Max temp: 18.34C
Date: 2021-03-30, Temp: 19.84C, Min temp: 6.49C, Max temp: 21.08C
Date: 2021-03-31, Temp: 20.77C, Min temp: 9.49C, Max temp: 21.59C
Date: 2021-04-01, Temp: 15.61C, Min temp: 6.83C, Max temp: 15.57C
Date: 2021-04-02, Temp: 11.81C, Min temp: 3.89C, Max temp: 13.75C
Date: 2021-04-03, Temp: 12.78C, Min temp: 4.46C, Max temp: 14.36C
```

## Build a native executable
You can build a native binary on your computer and this is done with the command `dart compile exe`. At the moment, we [cannot cross-compile for multiple target platforms](https://github.com/dart-lang/sdk/issues/28617).

```
$ dart compile exe bin/weather.dart -o weather
Info: Compiling without sound null safety
Generated: /Users/peter/src/github.com/merikan/dart_playground/weather/weather

$ ls -ltra ./weather
-rwxr-xr-x  1 peter  staff  8475144 29 Mar 15:03 ./weather*

$ ./weather --help
Dart Weather CLI

Usage: weather <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  now    Prints weather for right now at a given city
  week   Prints weather for the week in a given city

Run "weather help <command>" for more information about a command.
```