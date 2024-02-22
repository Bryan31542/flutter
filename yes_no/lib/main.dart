import 'package:flutter/material.dart';
import 'package:yes_no/config/theme/app_theme.dart';
import 'package:yes_no/presentation/screen/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yes No App',
      theme: AppTheme(selectedColor: 2).theme(),
      home: const ChatScreen()
    );
  }
}