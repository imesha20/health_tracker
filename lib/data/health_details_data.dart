import 'package:fitness_tracker/Models/health_activity_model.dart';

class HealthDetails {

  final healthDetails = [
    HealthActivityModel(
      icon: "assets/icons/drops.png", 
      value: "230ml", 
      title: "Water Intake"
      ),
      HealthActivityModel(
        icon: "assets/icons/footsteps.png", 
      value: "7.8km", 
      title: "Step Count"),

      HealthActivityModel(
      icon: "assets/icons/daily-calorie-needs.png", 
      value: "340k", 
      title: "Calories Burned"
      ),
      HealthActivityModel(
      icon: "assets/icons/sleeping-mask.png", 
      value: "7h4m", 
      title: "Sleep"
      ),

  ];

  

}