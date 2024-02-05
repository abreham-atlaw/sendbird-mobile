import 'package:assessment/features/core/presentation/screens/chat_screen.dart';
import 'package:flutter/material.dart';
void main() async{
  runApp(const AssessmentApp());
}

class AssessmentApp extends StatelessWidget {
  const AssessmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat",
      home: ChatScreen(),
    );
  }
}