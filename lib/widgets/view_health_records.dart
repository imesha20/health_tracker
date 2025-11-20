import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:fitness_tracker/widgets/floating_action_button.dart';



class ViewHealthRecords extends StatefulWidget {
  const ViewHealthRecords({super.key});

  @override
  State<ViewHealthRecords> createState() => _HealthRecordsScreenState();

  
}

class _HealthRecordsScreenState extends State<ViewHealthRecords> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> healthRecords = [
    {
      "steps": "2500 steps • 150 kcal",
      "water": "Water: 4 ml",
      "date": "2025-11-17"
    },
    {
      "steps": "5000 steps • 5000 kcal",
      "water": "Water: 2 ml",
      "date": "2025-11-15"
    },
    {
      "steps": "1000 steps • 520 kcal",
      "water": "Water: 6 ml",
      "date": "2025-11-14"
    },
    {
      "steps": "100 steps • 1500 kcal",
      "water": "Water: 6 ml",
      "date": "2025-11-12"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Health Records",
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Ionicons.filter_outline, color: Colors.white),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // Search / Filter Bar
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                children: [
                  const Icon(Ionicons.search, color: Colors.white54, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search by date (YYYY-MM-DD)",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Records List
            Expanded(
              child: ListView.builder(
                itemCount: healthRecords.length,
                itemBuilder: (context, index) {
                  final item = healthRecords[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        // Icon
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade800,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Ionicons.calendar_outline, color: Colors.white),
                        ),
                        const SizedBox(width: 12),

                        // Text Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["steps"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item["water"],
                                style: const TextStyle(color: Colors.white70, fontSize: 14),
                              ),
                            ],
                          ),
                        ),

                        /// Date
                        Text(
                          item["date"],
                          style: const TextStyle(color: Colors.white54, fontSize: 13),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      //Floating Add Button
      floatingActionButton: const CustomFAB(),

    );
  }
}

class AddHealthEntryScreen extends StatelessWidget {
  const AddHealthEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text("Add Health Entry"),
        backgroundColor: const Color(0xFF121212),
      ),
      body: const Center(
        child: Text("Add Health Entry Form Here", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
