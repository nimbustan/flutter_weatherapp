import 'dart:convert';
import 'package:flutter_weatherapp/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient{
  static const baseUrl = "https://www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String sehirAdi) async{
    final sehirURL = baseUrl + "/api/location/search/?query=" + sehirAdi;
    final gelenCevap = await httpClient.get(sehirURL);

    if(gelenCevap.statusCode != 200){
      throw Exception("Veri Gönderilemedi!");
    }

    final gelenCevapJSON = (jsonDecode(gelenCevap.body)) as List;
    return gelenCevapJSON[0]["woeid"];

  }
  Future<Weather> getWeather(int sehirID) async{
    final havaDurumuURL = baseUrl + "/api/location/$sehirID";
    final havaDurumuGelenCevap = await httpClient.get(havaDurumuURL);

    if (havaDurumuGelenCevap.statusCode != 200){
      throw Exception("Hava Durumu Getirilemedi!");
    }

    final havaDurumuCevapJSON = jsonDecode(havaDurumuGelenCevap.body);
    return Weather.fromJson(havaDurumuCevapJSON);
  }
}