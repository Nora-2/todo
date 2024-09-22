import 'package:flutter/material.dart';
import 'package:notesapp/shared/constants.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
      required this.validationText,
      required this.controller,
      required this.helper,
      })
      : super(key: key);
  final TextEditingController controller;
  final String validationText;

  final String helper;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return validationText;
        }
        return null;
      },
      controller: controller,
      keyboardType: TextInputType.text,
      cursorColor: kPrimaryColor,
     minLines: 3,
     maxLines: 4,
      decoration: InputDecoration(
          hintText: helper,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(15)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(15)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
