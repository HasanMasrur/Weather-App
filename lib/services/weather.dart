import '../services/location.dart';
import '../services/networking.dart';

const apikey = '1cd7044d691bcde1863a0f74a89c7793';
const openurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
Future<dynamic> getcityWeather(String cityname) async {
  String city =cityname;
    NetworkHelper networkHelper =
        NetworkHelper('$openurl?q=$city&appid=$apikey&units=metric');
        print(networkHelper);
    var weatherdata = await networkHelper.getdata();
    return weatherdata;
  }

  Future<dynamic> getlocationweather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openurl?lat=${location.lititude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherdata = await networkHelper.getdata();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
