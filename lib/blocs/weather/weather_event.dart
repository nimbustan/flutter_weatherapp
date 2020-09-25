part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent {
  @override
  List<Object> get props => [];

  final String sehirAdi;
  FetchWeatherEvent({@required this.sehirAdi});
}
