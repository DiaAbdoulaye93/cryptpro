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
  String storedPasscode = '123456';
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/homePerson.gif"),
        Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 70),
          child: Column(
            children: [
              const Text(
                "Construisez votre avenir",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  child: const Text(
                    "Commencez à investir dès aujourd'hui et votre avenir s'améliorera.",
                    style: TextStyle(
                        color: Color.fromARGB(255, 197, 190, 190),
                        letterSpacing: 2.0,
                        wordSpacing: 3),
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
        ),
        Center(
            child: SliderButton(
          width: 350,
          action: () {
            ///Do something here
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => _showLockScreen(
                        context,
                        opaque: false,
                        cancelButton: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          semanticsLabel: 'Cancel',
                        ),
                      )
                      ),
            );
          },
          label: const Text(
            "Demarrer maintennant       › › ›",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          icon: const Icon(Icons.navigate_next),
          // backgroundColor: Color.fromARGB(63,62,69, 69),
          backgroundColor: Color.fromARGB(60, 255, 255, 255),
        ))
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  _showLockScreen(
    BuildContext context, {
    required bool opaque,
    CircleUIConfig? circleUIConfig,
    KeyboardUIConfig? keyboardUIConfig,
    required Widget cancelButton,
    List<String>? digits,
  }) {
    PageRouteBuilder(
      opaque: opaque,
      pageBuilder: (context, animation, secondaryAnimation) => PasscodeScreen(
        title: const Text(
          'Enter App Passcode',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        circleUIConfig: circleUIConfig,
        keyboardUIConfig: keyboardUIConfig,
        passwordEnteredCallback: _onPasscodeEntered,
        cancelButton: cancelButton,
        deleteButton: const Text(
          'Delete',
          style: TextStyle(fontSize: 16, color: Colors.white),
          semanticsLabel: 'Delete',
        ),
        shouldTriggerVerification: _verificationNotifier.stream,
        backgroundColor: Colors.black.withOpacity(0.8),
        cancelCallback: _onPasscodeCancelled,
        digits: digits,
        passwordDigits: 6,
        bottomWidget: _buildPasscodeRestoreButton(),
      ),
    );
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = storedPasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    // if (isValid) {
    //   setState(() {
    //     this.isAuthenticated = isValid;
    //   });
    // }
  }

  _buildPasscodeRestoreButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
          child: TextButton(
            onPressed: _resetAppPassword,
            child: const Text(
              "Reset",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            // splashColor: Colors.white.withOpacity(0.4),
            // highlightColor: Colors.white.withOpacity(0.2),
            // ),
          ),
        ),
      );

  _resetAppPassword() {
    Navigator.maybePop(context).then((result) {
      if (!result) {
        return;
      }
      _showRestoreDialog(() {
        Navigator.maybePop(context);
        //TODO: Clear your stored passcode here
      });
    });
  }

  _showRestoreDialog(VoidCallback onAccepted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Reset passcode",
            style: TextStyle(color: Colors.black87),
          ),
          content: const Text(
            "Passcode reset is a non-secure operation!\n\nConsider removing all user data if this action performed.",
            style: TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: const Text(
                "Cancel",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            TextButton(
              child: const Text(
                "I understand",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: onAccepted,
            ),
          ],
        );
      },
    );
  }
}
