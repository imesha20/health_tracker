import 'package:flutter/material.dart';
import 'package:fitness_tracker/db_helper/db/db_helper.dart';
import 'package:fitness_tracker/Models/view_health_records_model.dart';

class AddHealthEntries extends StatefulWidget {
  final HealthRecord? record;

  const AddHealthEntries({super.key, this.record});

  @override
  State<AddHealthEntries> createState() => _AddHealthEntriesState();
}

class _AddHealthEntriesState extends State<AddHealthEntries> {
  final TextEditingController stepsController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController waterController = TextEditingController();
  final TextEditingController sleepController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  bool get isEditing => widget.record != null;

  @override
  void initState() {
    super.initState();
    if (isEditing) {
      final record = widget.record!;
      stepsController.text = record.steps.toString();
      caloriesController.text = record.calories.toString();
      waterController.text = record.water.toString();
      sleepController.text = record.sleep.toString();
      selectedDate = DateTime.tryParse(record.date) ?? DateTime.now();
    }
  }

  @override
  void dispose() {
    stepsController.dispose();
    caloriesController.dispose();
    waterController.dispose();
    sleepController.dispose();
    super.dispose();
  }

  String formatDate(DateTime d) =>
      "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";

  Future<void> save() async {
  // --- VALIDATION SECTION ---
  if (stepsController.text.trim().isEmpty ||
      caloriesController.text.trim().isEmpty ||
      waterController.text.trim().isEmpty ||
      sleepController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please fill all fields before saving."),
        backgroundColor: Colors.red,
      ),
    );
    return; // Stop here
  }

  // --- SAVE DATA IF VALID ---
  final record = HealthRecord(
    id: widget.record?.id,
    date: formatDate(selectedDate),
    steps: int.parse(stepsController.text),
    calories: int.parse(caloriesController.text),
    water: int.parse(waterController.text),
    sleep: double.parse(sleepController.text),
  );

  if (isEditing) {
    await DBHelper.instance.updateRecord(record);
  } else {
    await DBHelper.instance.insertRecord(record);
  }

  if (!mounted) return;
  Navigator.pop(context, true);
}


  Future pickDate() async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (newDate != null) setState(() => selectedDate = newDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: Text(isEditing ? "Update Record" : "Add Record"),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickDate,
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatDate(selectedDate),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(Icons.calendar_today, color: Colors.white70),
                  ],
                ),
              ),
            ),
            buildField("Steps", Icons.directions_walk, stepsController),
            const SizedBox(height: 12),
            buildField(
              "Calories",
              Icons.local_fire_department,
              caloriesController,
            ),
            const SizedBox(height: 12),
            buildField("Water (ml)", Icons.water_drop, waterController),
            const SizedBox(height: 12),
            buildField("Sleep (hrs)", Icons.bedtime, sleepController),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  isEditing ? "Update" : "Save",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildField(String label, IconData icon, TextEditingController con) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: con,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.white70),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white54),
          border: InputBorder.none,
        ),
      ),
    );
  }
}