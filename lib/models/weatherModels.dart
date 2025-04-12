class WeatherModel {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final String description;
  final double windSpeed;
  final String country;

  // Constructor
  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.description,
    required this.windSpeed,
    required this.country,
  });

  // Factory method for JSON deserialization
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      humidity: json['main']['humidity'],
      description: json['weather'][0]['description'],
      windSpeed: json['wind']['speed'],
      country: json['sys']['country'],
    );
  }

  // Override toString to easily print object
  @override
  String toString() {
    return 'City: $cityName, Temperature: $temperature, Description: $description';
  }
}
