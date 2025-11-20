import 'package:fitness_tracker/Models/graph_model.dart';
import 'package:fitness_tracker/constant/colors.dart';
import 'package:fitness_tracker/data/bar_graph_data.dart';
import 'package:fitness_tracker/utils/responsive.dart';
import 'package:fitness_tracker/widgets/custom_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraphCard extends StatelessWidget {
  const BarGraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    
    //bar graph data 
    final barGraphData = BarGraphData();

    final bool isMobile=Responsive.isMobile(context);


    return GridView.builder(
      itemCount:barGraphData.data.length ,
      shrinkWrap: true,
     physics: const ScrollPhysics(),



      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
    (crossAxisCount:isMobile? 2:3,
    mainAxisSpacing: 12,
    crossAxisSpacing:15,
    childAspectRatio: 5/4, 
    ),
     itemBuilder:(context,index){
      
      return CustomCard
      (padding: const  EdgeInsets.all(5),
        color: greyColor,
        
        child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Text(barGraphData.data[index].lable,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: greyColor,
            
            ),
            ),
          ),
          //bar graph 
          const SizedBox(height: 12,
          ),
          Expanded(
            child:BarChart(
              BarChartData(
                barGroups: chartGroups(
  color: barGraphData.data[index].color,
  point: barGraphData.data[index].graph,
),


                borderData: FlBorderData(border: const Border(),),
                titlesData: FlTitlesData(

                  // remove the left title 
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                   // remove the right title 
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                   // remove the top title 
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),

                  //bottom titles

                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value,TitleMeta meta) {
                     return Padding(
                       padding: const EdgeInsets.only(top: 5,),
                       child: Text(barGraphData.lable[value.toInt()],
                       style: const TextStyle(
                        fontSize:11 ,
                        color: greyColor,
                        fontWeight: FontWeight.w500 ,
                       ),
                       
                       ),
                     );

                      
                    },
                  ),
                ),

                ),



              ),
              ),
              ),
        ],
      ));

     },);

  }
  List<BarChartGroupData> chartGroups (
    
    {
      required List <GraphModel> point, required Color color
    }
  ){
    return point. map((point)=>BarChartGroupData(
      x:point.x.toInt(),
      barRods: [
        BarChartRodData(toY: point.y,
        width: 12,
        color: color.withOpacity(point.y.toInt()> 4 ? 1:0.4),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
           topRight: Radius.circular(10),
        ),
        ),

      ]

    ),).toList();

  }

}