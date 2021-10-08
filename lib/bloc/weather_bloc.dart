import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:iceland/models/forecast/weather_model.dart';
import 'package:iceland/services/api.dart';
import 'package:iceland/helpers/extensions.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  Weather _current = Weather();
  final Api _api = Api();

  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if(event is WeatherGetDataEvent) {
        emit.call(WeatherGettingData());
        await _fetchCurrentWeather(emit);
      }
    });
  }

  Future<void> _fetchCurrentWeather(Emitter<WeatherState> emit) async {
    Response response = await _api.getForecastWeather('Warszawa');
    switch(response.statusCode) {
      case 200:
        _current = Weather.fromJson(jsonDecode(response.body));
        emit.call(WeatherHasData(_current));
        break;
      default:
        String msg = 'Internal Server Error 500 !';
        if (response.statusCode.isBetween(299, 400)) {
          msg = 'There where some problem with getting data !';
        }
        emit.call(WeatherNoData(msg));
        break;
    }
  }
}
