import 'package:fitness_tracker/Models/bar_graph_model.dart';
import 'package:fitness_tracker/Models/graph_model.dart';
import 'package:fl_chart/src/chart/bar_chart/bar_chart_data.dart';
import 'package:flutter/material.dart';

class BarGraphData {

  final data = [
    BarGraphModel(lable: "Steps Count", 
    color: const Color.fromARGB( 255, 90, 128, 154 ), 
    graph: [
      GraphModel(x: 0, y: 8),
      GraphModel(x: 1, y: 19),
      GraphModel(x: 2, y: 7),
      GraphModel(x: 3, y: 4),
      GraphModel(x: 4, y: 1),
      GraphModel(x: 5, y: 6),
    ],
    ),
    BarGraphModel(lable: "Burned Calories", 
    color: const Color.fromARGB( 255, 174, 0, 255 ), 
    graph: [
      GraphModel(x: 0, y: 8),
      GraphModel(x: 1, y: 19),
      GraphModel(x: 2, y: 7),
      GraphModel(x: 3, y: 4),
      GraphModel(x: 4, y: 1),
      GraphModel(x: 5, y: 6),
    ],
    ),
    BarGraphModel(lable: "Water Intake", 
    color: const Color.fromARGB( 255, 3, 247, 178 ), 
    graph: [
      GraphModel(x: 0, y: 8),
      GraphModel(x: 1, y: 19),
      GraphModel(x: 2, y: 2),
      GraphModel(x: 3, y: 4),
      GraphModel(x: 4, y: 1),
      GraphModel(x: 5, y: 6),
    ],



    ),
   


  ];
   final lable=["M","T","W","T","F","Sat","Sun"];

  

  
}