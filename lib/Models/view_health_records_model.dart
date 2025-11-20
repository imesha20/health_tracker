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

  // Convert to Map for SQLite
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "date": date,
      "steps": steps,
      "calories": calories,
      "water": water,
      "sleep": sleep,
    };
  }

  // Convert from Map to Model
  factory HealthRecord.fromMap(Map<String, dynamic> map) {
    return HealthRecord(
      id: map["id"],
      date: map["date"],
      steps: map["steps"],
      calories: map["calories"],
      water: map["water"],
      sleep: map["sleep"] * 1.0,
    );
  }
}
