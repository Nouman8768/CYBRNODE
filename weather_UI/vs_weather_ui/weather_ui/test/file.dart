import 'package:weather_ui/UI/weather_apidata.dart';

main(List<String> args) {
  Map<String, dynamic> json = {
    "coord": {
      "lon": 74.3436,
      "lat": 31.5497,
    },
    "weather": [
      {
        "id": 800,
        "main": "Clear",
        "description": "clear sky",
        "icon": "01d",
      }
    ],
    "base": "stations",
    "main": {
      "temp": 305.14,
      "feels_like": 305.97,
      "temp_min": 305.14,
      "temp_max": 307.21,
      "pressure": 1004,
      "humidity": 43
    },
    "visibility": 6000,
    "wind": {
      "speed": 6.17,
      "deg": 160,
    },
    "clouds": {"all": 0},
    "dt": 1633944570,
    "sys": {
      "type": 1,
      "id": 7585,
      "country": "PK",
      "sunrise": 1633914158,
      "sunset": 1633955750
    },
    "timezone": 18000,
    "id": 1172451,
    "name": "Lahore",
    "cod": 200
  };

  ApiData data = ApiData();
  data.fromJson(json);
  print(data.temprature);
  print(data.uiicon);
}
