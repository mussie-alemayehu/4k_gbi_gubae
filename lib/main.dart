import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '4 ኪሎ ግቢ ጉባኤ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFCDCC80),
          onPrimary: const Color(0xFF333333),
          secondary: const Color(0xFF03291F),
          tertiary: const Color(0xFF939139),
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('4 ኪሎ ግቢ ጉባኤ'),
        ),
      ),
    );
  }
}
