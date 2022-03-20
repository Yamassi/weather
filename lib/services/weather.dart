import 'package:weather/services/networking.dart';
import 'package:weather/services/location.dart';

const apiKey = '627398d9c423da364f8e908d9271b78a';
const openWeatherMap = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMap?q=$cityName&appid=$apiKey&units=metric&lang=ru';

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMap?lat=${location.latitude}&lon=${location.longtitude}&appid=$apiKey&units=metric&lang=ru');
    var weatherData = await networkHelper.getData();
    return weatherData;
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
      return 'время для 🍦';
    } else if (temp > 20) {
      return 'время для шорт и 👕';
    } else if (temp < 10) {
      return 'вам нужен 🧣 и 🧤';
    } else {
      return 'возьмите 🧥 на всякий случай';
    }
  }
}
