import 'package:fitness_tracker/constant/colors.dart';
import 'package:fitness_tracker/utils/responsive.dart';
import 'package:fitness_tracker/widgets/pie_chart.dart';
import 'package:fitness_tracker/widgets/scheduled_widget.dart';
import 'package:fitness_tracker/widgets/summary_details.dart';
import 'package:flutter/material.dart';

class Summary extends StatefulWidget {
  const Summary ({super.key});

  @override
  State<Summary>createState()=>SummaryState();
  
}

class SummaryState extends State<Summary>{
  @override
  Widget build(BuildContext context){
    final bool isDesktop=Responsive.isDesktop(context);
    return   Container(
      decoration: BoxDecoration(
        color:!isDesktop?cardBgColor:null, 
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView( 
        child: Column(
          children: [
            PieChartCard(),
            const SizedBox(height: 12), 
      
      
             Text("Summary",style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: greyColor,
            ),
            ),
             const SizedBox(height: 12), 
      
      
            SummaryDetails(),
      
      const SizedBox(
        
        height: 30,),
        ScheduledWidget(),
      
      
        
          ],
          ),
        ),
      ),
    );
  }
}

