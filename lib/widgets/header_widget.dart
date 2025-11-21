
import 'package:fitness_tracker/constant/colors.dart';
import 'package:fitness_tracker/utils/responsive.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center row contents
      children: [
        // Menu icon for non-desktop screens
        if (!isDesktop)
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.menu,
                color: greyColor,
                size: 25,
              ),
            ),
          ),

        // Centered Application Name
        Expanded(
          child: Center(
            child: Text(
              "Health Mate",
              style: TextStyle(
                color: Colors.purple,      // Changed to purple
                fontSize: 26,              // Slightly larger font
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // Profile / end drawer icon for non-desktop screens
        if (!isDesktop)
          InkWell(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/icons/images/flowers.png",
                  width: 40,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
