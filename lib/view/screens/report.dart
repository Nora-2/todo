import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/controller/controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ReportPage extends StatelessWidget {
  ReportPage({super.key});
  final SQLController sqlController = Get.find<SQLController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Report"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GetBuilder<SQLController>(
          builder: (controller) {
            int createdTasks = controller.list.length;
            int completedTasks = controller.list.where((task) => task.completed == 1).length;
            int liveTasks = createdTasks - completedTasks;
            String percent = (createdTasks > 0) ? (completedTasks / createdTasks * 100).toStringAsFixed(0) : "0";

            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const Divider(thickness: 2),
               const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatus(Colors.green, liveTasks, "Live Tasks"),
                    _buildStatus(Colors.orange, completedTasks, "Completed"),
                    _buildStatus(Colors.blue, createdTasks, "Created"),
                  ],
                ),
                const SizedBox(height: 100),
                Center(
                  child: CircularStepProgressIndicator(
                    totalSteps: createdTasks > 0 ? createdTasks : 1,
                    currentStep: completedTasks,
                    stepSize: 20,
                    selectedColor: Colors.green,
                    unselectedColor: Colors.grey[200],
                    padding: 0,
                    width: 200,
                    height: 200,
                    selectedStepSize: 22,
                    roundedCap: (_, __) => true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$percent%",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Efficiency",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _buildStatus(Color color, int number, String text) {
  return Row(
    children: [
      Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: color),
        ),
      ),
      const SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$number",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    ],
  );
}
