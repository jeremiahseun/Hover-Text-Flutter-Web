// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'custom_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Scaffold(
        body: Center(
          child: MyCustomText(),
        ),
      ),
    );
  }
}
