import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/shared/constants.dart';
import 'package:notesapp/controller/controller.dart';
import 'package:notesapp/shared/custom_text_form_field.dart';

class EditScreen extends StatefulWidget {
  const EditScreen(
      {Key? key, this.id, this.title, this.desc, this.time, this.complete})
      : super(key: key);
  final int? id;
  final String? title;
  final String? desc;
  final String? time;
  final int? complete;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final titleController = TextEditingController();
  final desController = TextEditingController();
  final SQLController controller = Get.find();
  @override
  void initState() {
    super.initState();
    if (controller.updateTaskData) {
      titleController.text = widget.title ?? '';
      desController.text = widget.desc ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.updateTaskData ? "Update Note" : "Add Note"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(width: 2, color: kPrimaryColor.withOpacity(.8)),
                ),
                child: CustomFormField(
                  helper: 'Title',
                  validationText: "The title must have a value",
                  controller: titleController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(width: 2, color: kPrimaryColor.withOpacity(.8)),
                ),
                height: 200,
                child: TextField(
                  controller: desController,
                  maxLines: null, // Allows multiple lines
                  decoration: const InputDecoration(
                    helperText: "Description ",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  onSubmitted: (value) {
                    // Add new line on Enter
                    if (value.isNotEmpty) {
                      desController.text += '\n'; // Add newline
                      desController.selection = TextSelection.fromPosition(
                        TextPosition(
                            offset:
                                desController.text.length), // Move cursor to end
                      );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: MaterialButton(
                height: 50,
                onPressed: () {
                  if (!controller.updateTaskData) {
                    controller.insertData(
                      title: titleController.text,
                      description: desController.text
                          .trim(), // Trim to remove unnecessary spaces
                    );
                  } else {
                    controller.updateDataa(
                      title: titleController.text,
                      description: desController.text.trim(),
                      id: widget.id!,
                      completed: widget.complete!,
                    );
                  }
                  controller.updateTaskData = false;
                  controller.update();
                  desController.clear();
                  titleController.clear();
                   // Notify listeners
                  Get.back();
                },
                textColor: Colors.white,
                color: kPrimaryColor,
                minWidth: 350,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  controller.updateTaskData ? "Update" : "Add",
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
