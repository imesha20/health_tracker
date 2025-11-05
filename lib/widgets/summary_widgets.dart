import 'package:flutter/material.dart';

class Summary extends StatefulWidget {
  const Summary ({super.key});

  @override
  State<Summary>createState()=>SummaryState();
  
}

class SummaryState extends State<Summary>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
    body: Center(child: Text("Summary",
     style: TextStyle(
          color:Colors.white 
          ),
    ),),
     ) ;
  }
  
}

