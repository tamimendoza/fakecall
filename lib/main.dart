import 'package:fakecall/screen_llamando.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fake call',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenLlamando(),
    );
  }
}
