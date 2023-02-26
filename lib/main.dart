import 'package:cryptpro/pages/homescreen.dart';
import 'package:cryptpro/pages/mainscreen.dart';
import 'package:cryptpro/widgets/cgf_charts.dart';
import 'package:cryptpro/widgets/popup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(1, 1, 2, 0.357),
        body: Center(
          child:ListView(
            children: const [
              MainScreen(),
            ],
          ),
        ),
      ),
    );
  }
}