import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_ui/UI/weather_apidata.dart';

class OpenweatherApiDataRequester {
  String? location;
  double? temprature;
  String? uiicon;

  OpenweatherApiDataRequester({this.location}) {
    location = this.location;
  }
  //named constructor for the value of location in  URL

  Future<ApiData> getData() async {
    final String uri =
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=2128fd6e36b66857a8329a16ea0bf00f";
    final Uri url = Uri.parse(uri);
    final response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    ApiData apiData = ApiData();
    apiData.fromJson(data);
    print(apiData.temprature);
    print(apiData.uiicon);
    return apiData;
  }
}
