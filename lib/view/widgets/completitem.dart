import 'dart:math';
import 'package:flutter/material.dart';
import 'package:notesapp/controller/controller.dart';
import 'package:notesapp/shared/constants.dart';

class CompleteTodoItem extends StatelessWidget {
  const CompleteTodoItem({Key? key, required this.controller, required this.index})
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
           
            title: Row(
              children: [
                Text(controller.list[index].title,style:const TextStyle(decoration: TextDecoration.lineThrough),),
                const Spacer(),
                
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
                    return Text("${idx + 1}. $desc",style:const TextStyle(decoration: TextDecoration.lineThrough),);
                  }).toList(),
                  const SizedBox(height: 4.0), // Space between description and date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      Text(
                        controller.list[index].time,style:const TextStyle(decoration: TextDecoration.lineThrough),
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
