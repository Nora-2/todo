import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controller/controller.dart';
import 'package:notesapp/view/widgets/completitem.dart';

class CompleteScreen extends StatelessWidget {
  const CompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Tasks'),
        centerTitle: true,
      ),
      body: GetBuilder<SQLController>(
        builder: (controller) {
          final completedTasks = controller.list.where((task) => task.completed == 1).toList();
          return completedTasks.isEmpty
              ?  Center(child: Image.asset('assets/Inbox cleanup-pana.png'))
              : ListView.builder(
                  itemCount: completedTasks.length,
                  itemBuilder: (context, index) {
                    return CompleteTodoItem(
                      controller: controller,
                      index: controller.list.indexOf(completedTasks[index]), // Use the original index
                    );
                  },
                );
        },
      ),
    );
  }
}
