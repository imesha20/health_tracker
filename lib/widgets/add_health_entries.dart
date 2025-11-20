import 'package:fitness_tracker/db_helper/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker/Models/view_health_records_model.dart';


class AddHealthEntries extends StatefulWidget {
  final HealthRecord? record; // NULL → add mode / NON-NULL → edit mode

  const AddHealthEntries({super.key, this.record});

  @override
  State<AddHealthEntries> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddHealthEntries> {
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
      // Load values into text fields
      selectedDate = DateTime.parse(widget.record!.date);
      stepsController.text = widget.record!.steps.toString();
      caloriesController.text = widget.record!.calories.toString();
      waterController.text = widget.record!.water.toString();
      sleepController.text = widget.record!.sleep.toString();
    }
  }

  Future<void> pickDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.purple,
              onPrimary: Colors.white,
              surface: Colors.black,
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
    }
  }

  Widget buildInputField({
    required IconData icon,
    required String label,
    required TextEditingController controller,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.white70),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white60),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Future<void> saveOrUpdate() async {
    final record = HealthRecord(
      id: isEditing ? widget.record!.id : null,
      date: selectedDate.toString().split(" ")[0],
      steps: int.tryParse(stepsController.text) ?? 0,
      calories: int.tryParse(caloriesController.text) ?? 0,
      water: int.tryParse(waterController.text) ?? 0,
      sleep: double.tryParse(sleepController.text) ?? 0.0,
    );

    if (isEditing) {
      await DBHelper.instance.updateRecord(record);
    } else {
      await DBHelper.instance.insertRecord(record);
    }

    if (!mounted) return;
    Navigator.pop(context, true); // return "true" to refresh list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        title: Text(isEditing ? "Update Record" : "Add Record"),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Date",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 6),

            // DATE FIELD
            GestureDetector(
              onTap: pickDate,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const Icon(Icons.calendar_today, color: Colors.white70),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            buildInputField(
              icon: Icons.directions_walk,
              label: "Steps Count",
              controller: stepsController,
            ),

            const SizedBox(height: 12),

            buildInputField(
              icon: Icons.local_fire_department,
              label: "Burned Calories",
              controller: caloriesController,
            ),

            const SizedBox(height: 12),

            buildInputField(
              icon: Icons.water_drop,
              label: "Water Intake (ml)",
              controller: waterController,
            ),

            const SizedBox(height: 12),

            buildInputField(
              icon: Icons.bedtime,
              label: "Sleep Hours",
              controller: sleepController,
            ),

            const SizedBox(height: 20),

            // SAVE / UPDATE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveOrUpdate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  isEditing ? "Update Record" : "Save Record",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
