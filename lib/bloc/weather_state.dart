part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherGettingData extends WeatherState {}

class WeatherHasData extends WeatherState {
  final Weather _current;
  Weather get current => _current;

  WeatherHasData(this._current);
}

class WeatherNoData extends WeatherState {
  final String _message;
  String get message => _message;

  WeatherNoData(this._message);
}
