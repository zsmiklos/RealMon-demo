import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'MainAppWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith( // for Win
        dragDevices: {ui.PointerDeviceKind.mouse, ui.PointerDeviceKind.touch, ui.PointerDeviceKind.stylus, ui.PointerDeviceKind.unknown},
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: MainAppWidget(),
    );
  }
}

