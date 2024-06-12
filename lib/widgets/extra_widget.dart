import 'package:app_clima/models/weather_forecast_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExtraWeather extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastAll> snapshot;

  const ExtraWeather({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.weather_forecast!.list;
    var humidity = forecastList![0].temp!.humidity;
    var wind = forecastList[0].wind!.speed;
    var rain = forecastList[0].clouds!.clouds;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text("$wind Km/h",
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Vento",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.drop,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '$humidity %',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Umidade",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.cloud_rain,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '$rain %',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Chuva",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
          ],
        )
      ],
    );
  }
}
