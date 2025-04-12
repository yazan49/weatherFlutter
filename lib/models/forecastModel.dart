class ForecastModel {
  final DateTime dateTime;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final String description;
  final String icon;
  final double windSpeed;

  ForecastModel({
    required this.dateTime,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.description,
    required this.icon,
    required this.windSpeed,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      dateTime: DateTime.parse(json['dt_txt']),
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }
  @override
  String toString() {
    return 'ForecastModel(dateTime: $dateTime, temp: $temperature°C, feelsLike: $feelsLike°C, humidity: $humidity%, desc: $description, icon: $icon, wind: $windSpeed m/s)';
  }

}
