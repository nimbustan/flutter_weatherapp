import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp/blocs/weather/weather_bloc.dart';
import 'package:flutter_weatherapp/widget/sehir_sec.dart';

import 'hava_durumu_resim.dart';
import 'location.dart';
import 'max_min_sicaklik.dart';
import 'son_guncelleme.dart';

class WeatherApp extends StatelessWidget {
  String kullanicininSectigiSehir = 'Ankara';
  Completer<void> _refreshCompleter;

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                kullanicininSectigiSehir = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SehirSecWidget()),
                );
                print('Seçilen Şehir: $kullanicininSectigiSehir');
                if (kullanicininSectigiSehir != null) {
                  _weatherBloc.add(
                      FetchWeatherEvent(sehirAdi: kullanicininSectigiSehir));
                }
              })
        ],
      ),
      body: Center(
        child: BlocBuilder(
            cubit: _weatherBloc,
            builder: (context, WeatherState state) {
              if (state is WeatherInitialState) {
                return Center(
                  child: Text("Şehir Seçiniz"),
                );
              }
              else if (state is WeatherLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              else if (state is WeatherLoadedState) {
                final getirilenWeather = state.weather;

                _refreshCompleter?.complete();
                _refreshCompleter = Completer();

                return RefreshIndicator(
                  onRefresh: (){
                    _weatherBloc.add(RefreshWeatherEvent(sehirAdi: kullanicininSectigiSehir));
                    return _refreshCompleter.future;
                  },
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: LocationWidget(
                            secilenSehir: getirilenWeather.title,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SonGuncellemeWidget(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: HavaDurumuResimWidget(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: MaxveMinSicaklikWidget(),
                        ),
                      ),
                    ],
                  ),
                );
              }
              else if (state is WeatherErrorState) {
                return Center(
                  child: Text("Hata Oluştu"),
                );
              }
              else{
                return null;
              }
            }),
      ),
    );
  }
}
