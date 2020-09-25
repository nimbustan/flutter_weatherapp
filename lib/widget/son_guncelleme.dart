import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp/blocs/weather/weather_bloc.dart';

class SonGuncellemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
        cubit: _weatherBloc,
        builder: (context, WeatherState state) {
          var yeniTarih = (state as WeatherLoadedState).weather.time.toLocal();

          return Text(
            'Son Güncelleme ' +
                TimeOfDay.fromDateTime(yeniTarih).format(context),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          );
        });
  }
}
