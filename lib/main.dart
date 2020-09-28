import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp/locator.dart';
import 'package:flutter_weatherapp/tema/tema_bloc.dart';
import 'blocs/weather/weather_bloc.dart';
import 'widget/weather_app.dart';

void main() {
  setupLocator();
  runApp(BlocProvider(
    create: (context) => TemaBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<TemaBloc>(context),
      builder: (context, TemaState state) => MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: (state as UygulamaTemasi).tema,
        home: BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
          child: WeatherApp(),
        ),
      ),
    );
  }
}
