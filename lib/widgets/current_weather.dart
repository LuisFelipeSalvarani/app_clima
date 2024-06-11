import 'package:app_clima/models/weather_forecast_daily.dart';
import 'package:app_clima/widgets/extra_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_clima/utilities/forecast_util.dart';

class CurrentWeather extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const CurrentWeather({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var data = snapshot.data;
    var forecastList = data!.list;
    var temp = forecastList![0].temp!.temp!.toStringAsFixed(0);
    var formattedDate = DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt! * 1000);
    return Container(
      height: MediaQuery.of(context).size.height - 230,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      decoration: BoxDecoration(
        color: const Color(0xff00A1FF).withOpacity(0.5),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      ),
      // spreadRadius: 5,
      child: Column(
        children: [
          Text(
            data.city!.name!,
            style: const TextStyle(
                height: 0.1, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 430,
            child: Stack(
              children: [
                Image(
                  image: AssetImage(
                    Util.findIcon('${forecastList[0].weather![0].main}', true)
                  ),
                  fit: BoxFit.fill,
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '$temp °C',
                            style: const TextStyle(
                                height: 0.1,
                                fontSize: 80,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${forecastList[0].weather![0].description}',
                            style: const TextStyle(fontSize: 25),
                          ),
                          Text(
                            Util.getFormattedDate(formattedDate),
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          ExtraWeather(snapshot: snapshot,),
        ],
      ),
    );
  }
}
