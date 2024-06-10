import 'package:app_clima/widgets/extra_widget.dart';
import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
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
            'Itapira',
            style: const TextStyle(
                height: 0.1, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 430,
            child: Stack(
              children: [
                Image(
                  image: AssetImage('assets/sunny.png'),
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
                            '26 °C',
                            style: const TextStyle(
                                height: 0.1,
                                fontSize: 80,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Sol',
                            style: const TextStyle(fontSize: 25),
                          ),
                          Text(
                            'Segunda-feira 2024',
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
          ExtraWeather(),
        ],
      ),
    );
  }
}
