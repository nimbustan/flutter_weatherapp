part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent {
  @override
  List<Object> get props => [sehirAdi];

  final String sehirAdi;
  FetchWeatherEvent({@required this.sehirAdi});
}

class RefreshWeatherEvent extends WeatherEvent {
  @override
  List<Object> get props => [sehirAdi];

  final String sehirAdi;
  RefreshWeatherEvent({@required this.sehirAdi});
}