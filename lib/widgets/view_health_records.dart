import 'package:fitness_tracker/widgets/add_health_entries.dart';
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
      "id": 1,
      "steps": "2500 steps • 150 kcal",
      "water": "Water: 4 ml",
      "date": "2025-11-17"
    },
    {
      "id": 2,
      "steps": "5000 steps • 5000 kcal",
      "water": "Water: 2 ml",
      "date": "2025-11-15"
    },
    {
      "id": 3,
      "steps": "1000 steps • 520 kcal",
      "water": "Water: 6 ml",
      "date": "2025-11-14"
    },
  ];

  // ------------------------------
  // DELETE CONFIRMATION DIALOG
  // ------------------------------
  void confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text("Delete Record", style: TextStyle(color: Colors.white)),
          content: const Text(
            "Are you sure you want to delete this health record?",
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                setState(() => healthRecords.removeAt(index));
                Navigator.pop(context);
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // ------------------------------
  // MAIN UI
  // ------------------------------
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
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // SEARCH BAR
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

            // LIST OF RECORDS
            Expanded(
              child: ListView.builder(
                itemCount: healthRecords.length,
                itemBuilder: (context, index) {
                  final item = healthRecords[index];

                  return GestureDetector(
                    onLongPress: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: const Color(0xFF1E1E1E),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.edit, color: Colors.white),
                                  title: const Text("Edit", style: TextStyle(color: Colors.white)),
                                  onTap: () {
                                    Navigator.pop(context);

                                    // Navigate with data
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AddHealthEntries(
                                          record: item,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.delete, color: Colors.red),
                                  title: const Text("Delete", style: TextStyle(color: Colors.red)),
                                  onTap: () {
                                    Navigator.pop(context);
                                    confirmDelete(index);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },

                    child: Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade800,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Ionicons.calendar_outline, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
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
                          Text(
                            item["date"],
                            style: const TextStyle(color: Colors.white54, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: CustomFAB(
  onPressed: () async {
    // Navigate to AddHealthEntries screen
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddHealthEntries(),
      ),
    );

    // Refresh the list after saving a new record
    if (result == true) {
      setState(() {});
    }
  },
),


    );
  }
}
