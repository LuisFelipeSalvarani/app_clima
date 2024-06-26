import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d', 'pt_BR').format(dateTime);
  }

  static String findIcon(String name, bool type) {
    if (type) {
      switch (name) {
        case "Clounds":
          return "assets/sunny.png";
        case "Rain":
          return "assets/rainy.png";
        case "Drizzle":
          return "assets/rainy.png";
        case "Thunderstorm":
          return "assets/thunder.png";
        case "Snow":
          return "assets/snow.png";
        default:
          return "assets/sunny.png";
      }
    } else {
      switch (name) {
        case "Clounds":
          return "assets/sunny_2d.png";
        case "Rain":
          return "assets/rainy_2d.png";
        case "Drizzle":
          return "assets/rainy_2d.png";
        case "Thunderstorm":
          return "assets/thunder_2d.png";
        case "Snow":
          return "assets/snow_2d.png";
        default:
          return "assets/sunny_2d.png";
      }
    }
  }
}