import 'package:fitness_tracker/widgets/add_health_entries.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key, required Future<Null> Function() onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.purpleAccent,
      foregroundColor: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddHealthEntries()),
        );
      },
      icon: const Icon(Ionicons.add),
      label: const Text("Add"),
    );
  }
}
