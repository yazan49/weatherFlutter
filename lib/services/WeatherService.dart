import 'dart:convert';
import 'package:flutter_app/models/forecastModel.dart';
import 'package:flutter_app/models/weatherModels.dart';
import 'package:http/http.dart' as http;
import '../utils/apiConstants.dart';

class WeatherService {
  static Future<WeatherModel> searchForCity(String city) async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}/weather?q=$city&appid=${ApiConstants.apiKey}&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);

    } else {
      throw Exception('City not found or error occurred: ${response.statusCode}');
    }
  }

  static Future<List<ForecastModel>> getForecast(String city) async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}/forecast?q=$city&appid=${ApiConstants.apiKey}&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> list = data['list'];
      return list.map((item) => ForecastModel.fromJson(item)).toList();
    } else {
      throw Exception('Forecast error: ${response.statusCode}');
    }
  }
}
