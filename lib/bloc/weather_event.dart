part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class WeatherGetDataEvent extends WeatherEvent {
}

class WeatherHasDataEvent extends WeatherEvent {
}

class WeatherHasNoDataEvent extends WeatherEvent {
}
