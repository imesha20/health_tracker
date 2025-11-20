import 'package:fitness_tracker/widgets/activity_widget.dart';
import 'package:fitness_tracker/widgets/bar_graph_card.dart';
import 'package:fitness_tracker/widgets/header_widget.dart';
import 'package:fitness_tracker/widgets/line_chart.dart';

import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 15,),
            const HeaderWidget(),
            const SizedBox(
              height: 15,
              
            ),
           const ActivityWidget(),
const SizedBox(
  height: 15
  ),
LineChartCard(),


SizedBox(
  height: 15
  ),
  
  BarGraphCard(), 
  SizedBox(
  height: 30,
  ),

            
            
          ],
          ),
      ),
      );
    
      
    
  }
}