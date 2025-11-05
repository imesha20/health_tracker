import 'package:fitness_tracker/widgets/dashboard.dart';
import 'package:fitness_tracker/widgets/side_menu.dart';
import 'package:fitness_tracker/widgets/summary_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(child: Row(
        children: [
          //side menu
          const Expanded(
            flex: 2,
            child: SizedBox(
              child: SideMenu(),
            ),
          ),

          //dashboard
           Expanded(
            flex: 7,
             child:  SizedBox(
              child: Dashboard(),
              
             ),
           ),
           //summery section
            Expanded(
              flex: 3 ,
              child:  SizedBox(
                child: Summary(),
               
              ),
            ),
        ],
      ))
    );
  }
}