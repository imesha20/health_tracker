import 'package:flutter/widgets.dart';

class Responsive {
  //methode to check wheather the device is a mobile
  static bool isMobile (BuildContext context) =>
  MediaQuery.of(context).size.width<850;

  //methode to check wheather the device is a Tablet
  static bool isTablet (BuildContext context) => 
  MediaQuery.of(context).size.width<1100 &&
  MediaQuery.of(context).size.width>= 850;

  //methode to check wheather the device is a Desktop
  static bool isDesktop (BuildContext context) => 
  MediaQuery.of(context).size.width>=1100 ;








}