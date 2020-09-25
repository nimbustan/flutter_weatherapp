part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState([List<Weather> list]);
}

class WeatherInitialState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}
class WeatherLoadedState extends WeatherState {
  final Weather weather;
  @override
  List<Object> get props => [weather];
  WeatherLoadedState({@required this.weather}):assert(weather != null);
}
class WeatherErrorState extends WeatherState {
  @override
  List<Object> get props => [];
}
