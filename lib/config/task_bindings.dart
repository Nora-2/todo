import 'package:get/get.dart';
import 'package:notesapp/controller/controller.dart';

class TasksBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SQLController());
  }
}
