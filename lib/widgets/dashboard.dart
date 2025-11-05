import 'package:fitness_tracker/widgets/activity_widget.dart';
import 'package:fitness_tracker/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard ({super.key});

  @override
  State<Dashboard>createState()=>DashboardState();
  
}

class DashboardState extends State<Dashboard>{
  @override
  Widget build(BuildContext context){
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:18, ),
        child: Column(
          children: [
           SizedBox(
            height: 15,) ,
          HeaderWidget(),
          SizedBox(
            height: 15,
            ) ,
            ActivityWidget(), 



          ],
          ),
      ),
    );
  }
  
}

