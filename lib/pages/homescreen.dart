import 'dart:async';

import 'package:cryptpro/pages/login.dart';
import 'package:cryptpro/pages/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:slider_button/slider_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/homePerson.gif"),
          ],
        )
        // Container(
        //   padding:
        //       const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 70),
        //   child: Column(
        //     children: [
        //       const Text(
        //         "Construisez votre avenir",
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 30,
        //             fontWeight: FontWeight.bold),
        //         textAlign: TextAlign.center,
        //       ),
        //       Container(
        //           padding: EdgeInsets.all(20),
        //           child: const Text(
        //             "Commencez à investir dès aujourd'hui et votre avenir s'améliorera.",
        //             style: TextStyle(
        //                 color: Color.fromARGB(255, 197, 190, 190),
        //                 letterSpacing: 2.0,
        //                 wordSpacing: 3),
        //             textAlign: TextAlign.center,
        //           ))
        //     ],
        //   ),
        // ),
        // Center(
        //     child: SliderButton(
        //   width: 350,
        //   action: () {
        //     ///Do something here
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) => _showLockScreen(
        //                 context,
        //                 opaque: false,
        //                 cancelButton: const Text(
        //                   'Cancel',
        //                   style: TextStyle(fontSize: 16, color: Colors.white),
        //                   semanticsLabel: 'Cancel',
        //                 ),
        //               )
        //               ),
        //     );
        //   },
        //   label: const Text(
        //     "Demarrer maintennant       › › ›",
        //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
        //   ),
        //   icon: const Icon(Icons.navigate_next),
        //   // backgroundColor: Color.fromARGB(63,62,69, 69),
        //   backgroundColor: Color.fromARGB(60, 255, 255, 255),
        // ))
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
