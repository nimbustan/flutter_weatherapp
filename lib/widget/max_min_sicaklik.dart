import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp/blocs/weather/weather_bloc.dart';

class MaxveMinSicaklikWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      cubit: _weatherBloc,
      builder: (_, WeatherState state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Maksimum: ' + (state as WeatherLoadedState).weather.consolidatedWeather[0].maxTemp.round().toString() + '°C',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Minimum: ' + (state as WeatherLoadedState).weather.consolidatedWeather[0].minTemp.round().toString() + '°C',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
