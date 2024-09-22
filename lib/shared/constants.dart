import 'package:flutter/animation.dart';

const kPrimaryColor =   Color.fromARGB(255, 255, 94, 0);
const kNotesBox = 'notes_box';
DateTime now = DateTime.now();
String date = '${now.toIso8601String().split('T')[0]} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

List<Color> kColors = const [
  Color.fromARGB(255, 183, 142, 194),
  Color.fromARGB(190, 146, 219, 235),
  Color(0xffEED6D9),
  Color.fromARGB(255, 181, 233, 214),
  Color.fromARGB(255, 244, 158, 67),
   Color.fromARGB(255, 67, 244, 170),
    Color.fromARGB(255, 255, 146, 217),
];
