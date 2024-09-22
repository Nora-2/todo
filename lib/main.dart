import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notesapp/config/task_bindings.dart';
import 'package:notesapp/view/screens/splash.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  TasksBindings().dependencies();
  await GetStorage.init();
  runApp(const MyApp());
}
  final box = GetStorage();
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: box.read("theme") == null || box.read("theme") != "dark"
          ? ThemeMode.light
          : ThemeMode.dark,
      initialBinding: TasksBindings(),
      home:const SplashScreen(),
    );
  }
  
}
