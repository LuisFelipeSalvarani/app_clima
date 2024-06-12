import 'package:app_clima/models/weather_forecast_all.dart';
import 'package:app_clima/widgets/extra_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_clima/utilities/forecast_util.dart';

class CurrentWeather extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastAll> snapshot;

  const CurrentWeather({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var data = snapshot.data!.weather_current;
    var temp = data!.temp!.temp.toStringAsFixed(0);
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(data.dt! * 1000);
    return Container(
      height: MediaQuery.of(context).size.height - 270,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      decoration: BoxDecoration(
        color: const Color(0xff00A1FF).withOpacity(0.5),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      ),
      child: Column(
        children: [
          Text(
            data.name!,
            style: const TextStyle(
                height: 0.1, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 380,
            child: Stack(
              children: [
                Image(
                  image: AssetImage(Util.findIcon(
                      '${data.weather![0].main}', true)),
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
                            '$temp°C',
                            style: const TextStyle(
                                height: 0.5,
                                fontSize: 80,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${data.weather![0].description}',
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
          ExtraWeather(
            snapshot: snapshot,
          ),
        ],
      ),
    );
  }
}
