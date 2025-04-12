import 'package:flutter/material.dart';
import 'package:flutter_app/models/weatherModels.dart';
import 'package:flutter_app/styles/AppStyle.dart';

class SearchedCard extends StatelessWidget {
  final WeatherModel data;
  final VoidCallback? onPress;

  SearchedCard({required this.data, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [AppTheme.secondary, AppTheme.background],
            begin: Alignment.topRight,
            end: Alignment.topLeft,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.secondary,
              blurRadius: 8,
              offset: Offset(1, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
              ),
              child: Icon(Icons.wb_sunny, size: 40, color: Colors.yellowAccent),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.cityName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.cloud_circle, size: 18, color: Colors.white70),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          data.description,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.thermostat_outlined,
                        size: 18,
                        color: Colors.white70,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '${data.temperature} °C',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.air, size: 18, color: Colors.white70),
                      SizedBox(width: 6),
                      Text(
                        '${data.windSpeed} m/s',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.water_drop, size: 18, color: Colors.white70),
                      SizedBox(width: 6),
                      Text(
                        '${data.humidity}%',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
