import 'dart:async';

import 'package:cryptpro/data/Model/walletModel.dart';
import 'package:cryptpro/data/commonrequest.dart';
import 'package:cryptpro/pages/homescreen.dart';
import 'package:cryptpro/pages/login.dart';
import 'package:cryptpro/pages/mainscreen.dart';
import 'package:cryptpro/widgets/cgf_charts.dart';
import 'package:cryptpro/widgets/popup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => MaterialApp(
                    theme: ThemeData(
                      primaryColor: Color.fromRGBO(1, 1, 2, 0.357),
                    ),
                    debugShowCheckedModeBanner: false,
                    routes: {
                      '/login': (context) => Login(),
                      '/home': (context) => MainScreen(),
                    },
                    initialRoute: '/login',
                  )));
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: HomeScreen(),
      ),
    );
  }
}
