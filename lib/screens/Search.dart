import 'package:flutter/material.dart';
import 'package:flutter_app/models/weatherModels.dart';
import 'package:flutter_app/services/WeatherService.dart';
import 'package:flutter_app/styles/AppStyle.dart';
import 'package:flutter_app/widget/SearchCard.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _cityController = TextEditingController();
  WeatherModel? weatherData;
  bool isLoading = false;

  void _onSearchPressed() async {
    final city = _cityController.text.trim();
    if (city.isEmpty) return;
    setState(() {
      isLoading = true;
    });
    try {
      final WeatherModel data = await WeatherService.searchForCity(city);
      setState(() {
        weatherData = data;
      });
      print(
        'Weather data: ${data.cityName}, ${data.temperature}°C, ${data.description}',
      );
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppTheme.background,
          appBar: AppBar(
            title: Text(
              'Enter city name',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: AppTheme.secondary,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: _cityController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'City Name',
                    hintStyle: TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                if (weatherData != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SearchedCard(
                      data: weatherData!,
                      onPress: () {
                        print('Card pressed: ${weatherData!.cityName}');
                        Navigator.pushNamed(context, '/details' , arguments: weatherData);
                      },
                    ),
                  ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onSearchPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.secondary,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Search',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
      ],
    );
  }
}
