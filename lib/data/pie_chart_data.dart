import 'package:fitness_tracker/constant/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';

class PieChartSampleData {
  final paiChartSectionsData =[
    PieChartSectionData(
      color: primaryColor,
      value: 25,
      showTitle: false,
      radius: 25,
    ),

    PieChartSectionData(
      color:const Color(0XFF26E5FF),
      value: 20,
      showTitle: false,
      radius: 22,
    ),

    PieChartSectionData(
     color:const Color.fromARGB(255,39,238,145),
      value: 15,
      showTitle: false,
      radius: 16,
    ),

    PieChartSectionData(
      color:primaryColor.withOpacity(0.1),
      value: 30,
      showTitle: false,
      radius: 13,
    ),


  ];
}