import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/forecastModel.dart';
import 'package:flutter_app/models/weatherModels.dart';
import 'package:flutter_app/services/WeatherService.dart';
import 'package:flutter_app/widget/SearchCard.dart';
import '../styles/AppStyle.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  WeatherModel? weatherData;
  List<ForecastModel> forecastData = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (weatherData == null) {
      weatherData = ModalRoute.of(context)!.settings.arguments as WeatherModel;

      WeatherService.getForecast(weatherData!.cityName)
          .then((data) {
            setState(() {
              forecastData = data;
            });
          })
          .catchError((error) {
            print('Error fetching forecast: $error');
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final WeatherModel weather = weatherData!;

    Map<String, List<ForecastModel>> byDate = {};
    for (var f in forecastData) {
      String dayKey = DateFormat('yyyy-MM-dd').format(f.dateTime);
      byDate.putIfAbsent(dayKey, () => []).add(f);
    }
    final daily =
        byDate.entries.map((e) {
          final temps = e.value.map((f) => f.temperature);
          final minT = temps.reduce(min);
          final maxT = temps.reduce(max);
          final icon = e.value.first.icon;
          return {'date': e.key, 'min': minT, 'max': maxT, 'icon': icon};
        }).toList();
    daily.sort((a, b) => (a['date'] as String).compareTo(b['date'] as String));

    final showDays = daily.take(5).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${weather.cityName} Weather',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppTheme.secondary,
      ),
      backgroundColor: AppTheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: SearchedCard(data: weather)),
            SizedBox(height: 24),
            Text(
              '5‑Day Forecast',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: showDays.length,
              itemBuilder: (ctx, i) {
                final day = showDays[i];
                final date = DateTime.parse(day['date'] as String);
                final weekday = DateFormat('EEEE').format(date);
                final iconCode = day['icon'] as String;
                final minT = day['min'] as double;
                final maxT = day['max'] as double;

                return Card(
                  color: AppTheme.secondary,
                  margin: EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Row(
                      children: [
                        Image.network(
                          'http://openweathermap.org/img/wn/$iconCode@2x.png',
                          width: 40,
                          height: 40,
                        ),

                        SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                weekday,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'High: ${maxT.toStringAsFixed(0)}°  Low: ${minT.toStringAsFixed(0)}°',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
