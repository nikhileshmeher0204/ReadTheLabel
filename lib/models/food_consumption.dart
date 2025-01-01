class FoodConsumption {
  final String foodName;
  final DateTime dateTime;
  final Map<String, double> nutrients;
  final String source;

  FoodConsumption({
    required this.foodName,
    required this.dateTime,
    required this.nutrients,
    required this.source,
  });

  Map<String, dynamic> toJson() => {
        'foodName': foodName,
        'dateTime': dateTime.toIso8601String(),
        'nutrients': nutrients,
        'source': source,
      };

  factory FoodConsumption.fromJson(Map<String, dynamic> json) {
    // Convert nutrients to proper type
    Map<String, double> nutrients = {};
    (json['nutrients'] as Map<String, dynamic>).forEach((key, value) {
      nutrients[key] = (value as num).toDouble();
    });

    return FoodConsumption(
      foodName: json['foodName'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      nutrients: nutrients,
      source: json['source'] as String,
    );
  }
}