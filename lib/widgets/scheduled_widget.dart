import 'package:fitness_tracker/constant/colors.dart';
import 'package:fitness_tracker/data/scheduled_data.dart';
import 'package:fitness_tracker/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class ScheduledWidget extends StatelessWidget {
  const ScheduledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scheduledData = ScheduledData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Scheduled",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: secondaryColor,
          ),
        ),
        const SizedBox(height: 12),

        // show the scheduled data
        for (var index = 0; index < scheduledData.sheculedtasks.length; index++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: CustomCard(
              color: greyColor,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            scheduledData.sheculedtasks[index].title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: secondaryColor,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            scheduledData.sheculedtasks[index].date,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: greyColor.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.alarm,
                        color: greyColor,
                        size: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}