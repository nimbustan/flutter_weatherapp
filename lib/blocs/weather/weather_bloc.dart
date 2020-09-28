import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weatherapp/data/weather_repository.dart';
import 'package:flutter_weatherapp/locator.dart';
import 'package:flutter_weatherapp/models/weather.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState());
  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  WeatherState get initialState => WeatherInitialState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try {
        final Weather getirilenWeather =
            await weatherRepository.getWeather(event.sehirAdi);
        yield WeatherLoadedState(weather: getirilenWeather);
      } catch (_) {
        yield WeatherErrorState();
      }
    } else if (event is RefreshWeatherEvent) {
      try {
        final Weather getirilenWeather =
            await weatherRepository.getWeather(event.sehirAdi);
        yield WeatherLoadedState(weather: getirilenWeather);
      } catch (_) {
        yield state;
      }
    }
  }
//   @override
//   Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
//     if (event is FetchWeatherEvent) {
//       yield* _mapWeatherRequestedToState(event);
//     } else if (event is RefreshWeatherEvent) {
//       yield* _mapWeatherRefreshRequestedToState(event);
//     }
//   }
//
//   Stream<WeatherState> _mapWeatherRequestedToState(
//       WeatherRequested event,
//       ) async* {yield WeatherLoadingState();
//   try {
//     final Weather getirilenWeather =
//     await weatherRepository.getWeather(event.sehirAdi);
//     yield WeatherLoadedState(weather: getirilenWeather);
//   } catch (_) {
//     yield WeatherErrorState();
//   }
//   }
//
//   Stream<WeatherState> _mapWeatherRefreshRequestedToState(
//       WeatherRefreshRequested event,
//       ) async* {
//     try {
//       final Weather weather = await weatherRepository.getWeather(event.city);
//       yield WeatherLoadSuccess(weather: weather);
//     } catch (_) {}
//   }
}
