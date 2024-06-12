import 'package:app_clima/api/weather_api.dart';
import 'package:app_clima/models/weather_forecast_all.dart';
import 'package:app_clima/pages/search_page.dart';
import 'package:app_clima/widgets/buttom_list.dart';
import 'package:app_clima/widgets/current_weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final WeatherForecastAll? locationWeather;

  const HomePage({super.key, required this.locationWeather});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WeatherForecastAll> weatherObj;
  late String _cityName;

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      weatherObj = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030317),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff00A1FF),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  weatherObj = WeatherApi().fetchWeatherForecast();
                });
              },
              child: const Icon(
                CupertinoIcons.location_circle,
                color: Colors.white,
                size: 30,
              ),
            ),
            const Row(
              children: [
                Icon(
                  CupertinoIcons.map_fill,
                  color: Colors.white,
                ),
                SizedBox(width: 8,),
                Text(
                  'openweathermap.org',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                )
              ],
            ),
            GestureDetector(
              child: const Icon(
                Icons.search_outlined,
                color: Colors.white,
                size: 30,
              ),
              onTap: () async {
                var tappedName = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const SearchPage();
                }));
                if (tappedName != null) {
                  setState(() {
                    _cityName = tappedName;
                    weatherObj = WeatherApi().fetchWeatherForecast(
                        cityName: _cityName, isCity: true);
                  });
                }
              },
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          FutureBuilder<WeatherForecastAll>(
              future: weatherObj,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return Column(
                    children: [
                      CurrentWeather(snapshot: snapshot),
                      ButtomListView(snapshot: snapshot),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'Erro ao carregar dados\nPor favor, tente novamente',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'Cidade não encontrada\n Por favor entre com a cidade correta',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
