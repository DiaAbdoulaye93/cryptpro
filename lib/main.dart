import 'package:cryptpro/pages/homescreen.dart';
import 'package:cryptpro/pages/mainscreen.dart';
import 'package:cryptpro/widgets/charts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(1, 1, 2, 0.357),
        body: Center(
          child:MainScreen(),
        ),
      ),
    );
  }
}