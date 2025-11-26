import 'package:flutter/material.dart';
import 'package:fitness_tracker/constant/colors.dart';
import 'package:fitness_tracker/db_helper/db/db_helper.dart';
import 'package:fitness_tracker/Models/view_health_records_model.dart';
import 'package:fitness_tracker/utils/responsive.dart';
import 'package:fitness_tracker/widgets/custom_card.dart';

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({super.key});

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  HealthRecord? latestRecord;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadLatestData();
  }

  Future<void> loadLatestData() async {
    latestRecord = await DBHelper.instance.getLatestRecord();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return GridView.count(
      crossAxisCount: isMobile ? 2 : 4,
      crossAxisSpacing: 15,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        buildCard("assets/icons/drops.png", "${latestRecord?.water ?? 0} ml", "Water Intake"),
        buildCard("assets/icons/footsteps.png", "${latestRecord?.steps ?? 0} steps", "Step Count"),
        buildCard("assets/icons/daily-calorie-needs.png", "${latestRecord?.calories ?? 0} kcal", "Calories Burned"),
        buildCard("assets/icons/sleeping-mask.png", "${latestRecord?.sleep ?? 0} h", "Sleep"),

      ],
    );
  }

  Widget buildCard(String icon, String value, String title) {
    return CustomCard(
      color: greyColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image.asset(
         icon,
         width: 30,
         height: 30,
  
         ),

          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              color: secondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: greyColor,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
