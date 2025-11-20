import 'package:fitness_tracker/constant/colors.dart';
import 'package:fitness_tracker/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class SummaryDetails extends StatelessWidget {
  const SummaryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: greyColor, // defined in colors.dart
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        children: [
          buildDetails( "Cal","305"),
          buildDetails("Steps","10238" ),
          buildDetails("Water Intake","700ml" ),
          buildDetails( "Sleep","7h"),

          
        ],
      ),
    );
  }

  Widget buildDetails(String key, String value){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          key, 
        style: const  TextStyle(
          fontSize: 11,
          color: secondaryColor,
        ),
        ),
        const SizedBox(height: 2,),
        Text(
          value, 
        style: const  TextStyle(
          fontSize: 10,
          color: greyColor,
        ),
        ),
      ],
    );

  }


}
