import 'package:fitness_tracker/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  final Widget child;
  final Color  color;
  final EdgeInsetsGeometry? padding;
  const CustomCard({
    super.key, 
    required this.child, 
    required this.color, 
    this.padding
    });

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: cardBgColor,
      ),
      child: Padding(
        padding: padding?? const EdgeInsets.all(12),
        child: child,
      ),
    );
    
  }
}