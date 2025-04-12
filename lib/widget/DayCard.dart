import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../styles/AppStyle.dart';

class DayCard extends StatelessWidget {
  final Map<String, dynamic> day;

  const DayCard({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(day['date'] as String);
    final weekday = DateFormat('EEEE').format(date);
    final iconCode = day['icon'] as String;
    final minT = day['min'] as double;
    final maxT = day['max'] as double;

    return Card(
      color: AppTheme.secondary,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
  }
}
