import 'package:fitness_tracker/constant/colors.dart';
import 'package:fitness_tracker/data/side_menu_data.dart';
import 'package:fitness_tracker/widgets/add_health_entries.dart';
import 'package:fitness_tracker/widgets/view_health_records.dart';
import 'package:flutter/material.dart';



class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> {
  //index tracker
  int selectedIndex = 0;
  final sideMenuData = SideMenuData();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      color: backgroundColor,
      child: ListView.builder(
        itemCount: sideMenuData.sideMenu.length,
        itemBuilder: (context, index) {
          return sideMenuList(sideMenuData, index);
        },
      ),
    );
  }

  Widget sideMenuList(SideMenuData sideMenuData, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        
        //  Navigation
        

        String selectedTitle = sideMenuData.sideMenu[index].title;

        if (selectedTitle == "Add Entry") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddHealthEntries(),
            ),
          );
        }

        if (selectedTitle == "Dashboard") {
          Navigator.pushNamed(context, "/dashboard");
        }

        if (selectedTitle == "Profile") {
          Navigator.pushNamed(context, "/profile");
        }

        if (selectedTitle == "View Health Records") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ViewHealthRecords(),
            ),
          );
        }

        if (selectedTitle == "History") {
          Navigator.pushNamed(context, "/history");
        }

        if (selectedTitle == "Logout") {
          // Handle logout here if needed
        }
      },

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: selectedIndex == index ? sectionColor : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                sideMenuData.sideMenu[index].icon,
                color: selectedIndex == index ? blackColor : greyColor,
              ),
              const SizedBox(width: 20),
              Text(
                sideMenuData.sideMenu[index].title,
                style: TextStyle(
                  color: selectedIndex == index ? blackColor : greyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
