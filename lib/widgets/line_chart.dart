import 'package:fitness_tracker/constant/colors.dart';
import 'package:fitness_tracker/data/line_chart_data.dart';
import 'package:fitness_tracker/widgets/custom_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';



class LineChartCard extends StatelessWidget {
  LineChartCard({super.key});

  final data = LineData();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: Colors.black54, // darker so chart stands out
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Steps Overview",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 16 / 6,
            child: LineChart(
              LineChartData(
                lineTouchData:
                    const LineTouchData(handleBuiltInTouches: true),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  rightTitles:
                      const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final label = data.bottomTitle[value.toInt()];
                        if (label == null) return const SizedBox();
                        return SideTitleWidget(
                          meta: meta,
                          child: Text(
                            label,
                            style: const TextStyle(
                              color: greyColor,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize:40,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final label = data.leftTitle[value.toInt()];
                        if (label == null) return const SizedBox();
                        return Text(
                          label,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        );
                      },
                      
                    ),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: data.spots,
                    
                    isCurved: false,
                     gradient: LinearGradient(
    colors: [
      sectionColor.withOpacity(0.9),
      sectionColor.withOpacity(0.3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
barWidth: 2.5,
  isStrokeCapRound: true,
  belowBarData: BarAreaData(
    show: true,
    gradient: LinearGradient(
      colors: [
        sectionColor.withOpacity(0.4),
        Colors.transparent,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  dotData: const FlDotData(show: false),
),




  
                ],

                minX: 0,
                maxX: 120, 
                
                minY: 0, 
                maxY: 100,


                     
                    


                    
                  ),
            ),
              ),
        ],
          ),
    );
  }
}
