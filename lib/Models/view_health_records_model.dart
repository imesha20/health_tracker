class HealthRecord {
  int? id;
  String date;
  int steps;
  int calories;
  int water;
  double sleep;

  HealthRecord({
    this.id,
    required this.date,
    required this.steps,
    required this.calories,
    required this.water,
    required this.sleep,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      "date": date,
      "steps": steps,
      "calories": calories,
      "water": water,
      "sleep": sleep,
    };
    if (id != null) map["id"] = id;
    return map;
  }

  factory HealthRecord.fromMap(Map<String, dynamic> map) {
    return HealthRecord(
      id: map["id"] as int?,
      date: map["date"] as String,
      steps: (map["steps"] ?? 0) as int,
      calories: (map["calories"] ?? 0) as int,
      water: (map["water"] ?? 0) as int,
      sleep: (map["sleep"] == null) ? 0.0 : (map["sleep"] as num).toDouble(),
    );
  }
}