import 'package:flutter/material.dart';

// import 'package:app_clima/models/weather_forecast_daily.dart';
// import 'package:app_clima/utilities/forecast_util.dart';

class ButtomListView extends StatelessWidget {
  const ButtomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Previsão da dos ultimos 7 dias'.toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  height: 160,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xff00A1FF).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // child: forecastCard(snapshot, index),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
              itemCount: 2,
              // itemCount: snapshot.data!.list!.length,
            ),
          )
        ],
      ),
    );
  }
}

Widget forecastCard() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        '25 °C',
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      Image(
        image: AssetImage(
          'assets/thunder.png',
        ),
        width: 55,
        height: 55,
      ),
      Text(
        'Segunda-feira',
        style: const TextStyle(color: Colors.white, fontSize: 20),
      )
    ],
  );
}
