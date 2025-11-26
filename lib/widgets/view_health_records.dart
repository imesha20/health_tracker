import 'package:flutter/material.dart';
import 'package:fitness_tracker/db_helper/db/db_helper.dart';
import 'package:fitness_tracker/Models/view_health_records_model.dart';
import 'package:fitness_tracker/widgets/add_health_entries.dart';

class ViewHealthRecords extends StatefulWidget {
  const ViewHealthRecords({super.key});

  @override
  State<ViewHealthRecords> createState() => _ViewHealthRecordsState();
}

class _ViewHealthRecordsState extends State<ViewHealthRecords> {
  List<HealthRecord> records = [];
  TextEditingController searchController = TextEditingController();
List<HealthRecord> filteredRecords = [];


  @override
  void initState() {
    super.initState();
    fetchRecords();
  }

  Future<void> fetchRecords() async {
  final data = await DBHelper.instance.getAllRecords();
  setState(() {
    records = data.map((e) => HealthRecord.fromMap(e)).toList();
    filteredRecords = records; // 🔥 initialize filtered list
  });
}
void filterByDate(String query) {
  setState(() {
    if (query.isEmpty) {
      filteredRecords = records;
    } else {
      filteredRecords = records
          .where((r) => r.date.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  });
}



  Future<void> deleteRecord(int id) async {
    await DBHelper.instance.deleteRecord(id);
    fetchRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text("Health Records"),
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
  backgroundColor: Colors.purple,
  onPressed: () async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddHealthEntries()),
    );
    if (result == true) fetchRecords();  // ✅ Refresh happens here
  },
  child: const Icon(Icons.add),
),

      
      body: Column(
  children: [
    // SEARCH BAR
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: searchController,
        onChanged: filterByDate,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Search by date (YYYY-MM-DD)",
          hintStyle: const TextStyle(color: Colors.white54),
          prefixIcon: const Icon(Icons.search, color: Colors.white),
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),

    // RECORD LIST VIEW
    Expanded(
      child: filteredRecords.isEmpty
          ? const Center(
              child: Text(
                "No Records Found",
                style: TextStyle(color: Colors.white70),
              ),
            )
          : ListView.builder(
              itemCount: filteredRecords.length,
              itemBuilder: (context, index) {
                final r = filteredRecords[index];
                return Card(
                  color: Colors.grey[900],
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddHealthEntries(record: r),
                        ),
                      );
                      if (result == true) fetchRecords();
                    },
                    title: Text(
                      r.date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Steps: ${r.steps} | Calories: ${r.calories}\n"
                      "Water: ${r.water}ml | Sleep: ${r.sleep}h",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Delete Record"),
                            content: const Text("Are you sure you want to delete this record?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await deleteRecord(r.id!);
                                },
                                child:
                                    const Text("Delete", style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    ),
  ],
      )
);

  }
}