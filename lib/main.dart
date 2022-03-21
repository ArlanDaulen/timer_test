import 'package:flutter/material.dart';
import 'package:timer/pages/advanced_task/ui/advanced_task.dart';
import 'package:timer/pages/firstTask/ui/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isFirstTask = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: isFirstTask ? 'Timer' : 'Task List',
      home: isFirstTask ? const MainPage() : const AdvancedTaskScreen(),
    );
  }
}
