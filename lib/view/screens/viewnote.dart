
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controller/controller.dart';
import 'package:notesapp/view/widgets/todo_item.dart';

class Viewdata extends StatelessWidget {
  
   Viewdata({
    super.key,
  });
  final SQLController control = Get.find();
  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<SQLController>(
      builder: (controller) {
        final activeTasks = controller.list.where((task) => task.completed == 0).toList(); // Only active tasks
        return ListView.builder(
          itemCount: activeTasks.isEmpty ? 1 : activeTasks.length,
          itemBuilder: (context, index) {
            return activeTasks.isEmpty
                ? Column(children: [const SizedBox(height: 80), Image.asset('assets/Add tasks-rafiki.png')])
                : TodoItem(controller: controller, index: controller.list.indexOf(activeTasks[index])); // Pass original index
          },
        );
      },
    );
  }
}
