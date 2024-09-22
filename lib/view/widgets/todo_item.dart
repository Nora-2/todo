import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controller/controller.dart';
import 'package:notesapp/shared/constants.dart';
import 'package:notesapp/view/screens/edit_screen.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.controller, required this.index})
      : super(key: key);
  final SQLController controller;
  final int index;
Color _getRandomColor() {
    Random random = Random();
    return kColors[random.nextInt(kColors.length)];
  }


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(controller.list[index].id.toString()), // Unique key for each item
      direction: DismissDirection.endToStart, // Swipe from right to left
      onDismissed: (direction) {
        controller.deleteData(id: controller.list[index].id!);
     
      },
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: _getRandomColor(),
      elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListTile(
            leading: Checkbox(
              value: controller.list[index].completed == 1,
              onChanged: (bool? value) {
                controller.updateTaskDataa = true;
                if (value != null) {
                  controller.updateDataa(
                    title: controller.list[index].title,
                    description: controller.list[index].description,
                    id: controller.list[index].id!,
                    completed: value ? 1 : 0, // Update completed status
                  );
                }
              },
            ),
            title: Row(
              children: [
                Text(controller.list[index].title),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    controller.updateTaskData = true;
                    Get.to(() => EditScreen(
                      id: controller.list[index].id,
                      title: controller.list[index].title,
                      desc: controller.list[index].description,
                      time: controller.list[index].time,
                      complete: controller.list[index].completed,
                    ));
                  },
                  icon: const Icon(
                    Icons.edit,
                  
                  ),
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display descriptions as an ordered list
                  ...controller.list[index].description.split('\n').asMap().entries.map((entry) {
                    int idx = entry.key;
                    String desc = entry.value;
                    return Text("${idx + 1}. $desc");
                  }).toList(),
                  const SizedBox(height: 4.0), // Space between description and date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      Text(
                        controller.list[index].time,
                        // Optional: style for the date
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
