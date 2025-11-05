import 'package:fitness_tracker/constant/colors.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(
          child:TextField(
        style:TextStyle(
          color:greyColor 
        ) ,
        decoration: InputDecoration(
          filled: true,
          fillColor: cardBgColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        labelStyle: const TextStyle(
         color: greyColor,
         ),

         border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
         ),
         focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color:Theme.of(context).primaryColor,
         )
        ),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        hintText: "Search",
        hintStyle: const TextStyle(
          color: greyColor,
        ),
        prefixIcon: const Icon(Icons.search,color: greyColor,
        size:21 ,
        )
        ),

        ),
         ),
      ],
    );
  }
}